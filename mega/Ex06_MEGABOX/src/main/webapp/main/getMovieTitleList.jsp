<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
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

    // JSON 객체 생성
    JSONObject jsonResponse = new JSONObject();
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    List<String> movieList = new ArrayList<>();
    
    try {
        conn = dbManager.getDBConnection();
        String sqlQuery = "SELECT NAME FROM MOVIE ORDER by OPENINGDATE DESC";
        pstmt = conn.prepareStatement(sqlQuery);
        rs = pstmt.executeQuery();
        
        while (rs.next()) {
            movieList.add(rs.getString("NAME"));
        }
        
        // JSON 배열에 결과 추가
        JSONArray jsonArray = new JSONArray();
        
        for (String movie : movieList) {
            jsonArray.add(movie);
        }
        jsonResponse.put("movies", jsonArray);
        
    } catch (Exception e) {
        e.printStackTrace();
        jsonResponse.put("error", "An error occurred while processing your request.");
    } finally {
        dbManager.dbClose(conn, pstmt, rs);
    }
    
    // JSON 응답을 출력합니다.
    response.setContentType("application/json; charset=UTF-8");
    out.print(jsonResponse.toJSONString());
%>