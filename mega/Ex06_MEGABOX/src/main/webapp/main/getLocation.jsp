
<%@page import="com.dbManager.dbManager"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, org.json.simple.JSONObject, org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page contentType="application/json; charset=UTF-8" %>

<%
    // 클라이언트로부터 전송된 데이터를 가져옵니다.
    String contryName = request.getParameter("locationText");

    // JSON 객체 생성
    JSONObject jsonResponse = new JSONObject();
    
    if (contryName != null && !contryName.isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> locationList = new ArrayList<>();
        
        try {
            conn = dbManager.getDBConnection();
            String sqlQuery = "SELECT DISTINCT LOCATION_NAME FROM CINEMA WHERE CONTRY = ? ORDER BY LOCATION_NAME ASC";
            pstmt = conn.prepareStatement(sqlQuery);
            pstmt.setString(1, contryName);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                locationList.add(rs.getString("LOCATION_NAME"));
            }
            
            // JSON 배열에 결과 추가
            JSONArray jsonArray = new JSONArray();
            for (String location : locationList) {
                jsonArray.add(location);
            }
            jsonResponse.put("locations", jsonArray);
            
        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.put("error", "An error occurred while processing your request.");
        } finally {
            dbManager.dbClose(conn, pstmt, rs);
        }
    } else {
        jsonResponse.put("error", "지역정보 없음.");
    }
    
    // JSON 응답을 출력합니다.
    response.setContentType("application/json; charset=UTF-8");
    out.print(jsonResponse.toJSONString());
%>