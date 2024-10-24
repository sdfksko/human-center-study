<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@page import="com.dbManager.dbManager"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.lang.reflect.Type" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, org.json.simple.JSONObject, org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.fasterxml.jackson.core.type.TypeReference" %>
<%@ page contentType="application/json; charset=UTF-8" %>
<%@ page import="com.google.gson.*" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>

<%
	String locationList = request.getParameter("locationList");
	String movieList = request.getParameter("movieList");
	StringBuilder jsonBuffer = new StringBuilder();
	String line;
// 	// JSON 데이터를 문자열로 읽어와서 reader에 저장 후jsonBuffer에 추가
// 	try (BufferedReader reader = request.getReader()) {
// 	    while ((line = reader.readLine()) != null) {
// 	        jsonBuffer.append(line);
// 	    }
// 	}


	List<String> locations = null;
	// 가져온 문자열이 null이 아니고 비어있지 않은지 확인합니다.
    if (locationList != null && !locationList.isEmpty()) {
    	// Gson 객체 생성
        Gson gson = new Gson();
        
        // JSON 문자열을 List<String>으로 변환하기 위한 TypeToken 사용
        Type type = new TypeToken<List<String>>() {}.getType();
        locations = gson.fromJson(locationList, type);

        // 변환된 List<String> 출력
        System.out.println("Received locationList: " + locations);

    } else {
        // locationList 파라미터가 제공되지 않은 경우 처리합니다.
        System.out.println("No locations provided.");
    }
	
	
	
// 	List<List<String>> locations = null;
//     if (locationList != null && !locationList.isEmpty()) {
//         // Gson 객체 생성
//         Gson gson = new Gson();
        
//      // TypeToken을 사용하여 제네릭 타입 정보를 제공
//         Type type = new TypeToken<List<List<String>>>() {}.getType();
//         // JSON 문자열을 Java List<List<String>>로 변환
//         locations = gson.fromJson(locationList, type);
        
        
// //         // JSON 문자열을 Java List<List<String>>로 변환
// //         TypeToken<List<List<String>>> token = new TypeToken<List<List<String>>>() {};
// //         locations = gson.fromJson(locationList, token.getType());
//     } else {
//         out.println("No movieList provided.");
//     }

    List<String> movies = null;
	// 가져온 문자열이 null이 아니고 비어있지 않은지 확인합니다.
    if (movieList != null && !movieList.isEmpty()) {
    	// Gson 객체 생성
        Gson gson = new Gson();
        
        // JSON 문자열을 List<String>으로 변환하기 위한 TypeToken 사용
        Type type = new TypeToken<List<String>>() {}.getType();
        movies = gson.fromJson(movieList, type);

        // 변환된 List<String> 출력
        System.out.println("Received locationList: " + movies);

    } else {
        // locationList 파라미터가 제공되지 않은 경우 처리합니다.
        System.out.println("No locations provided.");
    }
	
// 	List<List<String>> movies = null;
//     // movieList가 null이 아니고 비어있지 않은지 확인
//     if (movieList != null && !movieList.isEmpty()) {
//         // Gson 객체 생성
//         Gson gson = new Gson();
        

//         // TypeToken을 사용하여 제네릭 타입 정보를 제공
//            Type type = new TypeToken<List<List<String>>>() {}.getType();
//            // JSON 문자열을 Java List<List<String>>로 변환
//            movies = gson.fromJson(locationList, type);
        
// //         // JSON 문자열을 Java List<List<String>>로 변환
// //         TypeToken<List<List<String>>> token = new TypeToken<List<List<String>>>() {};
// //         movies = gson.fromJson(movieList, token.getType());

//         // 첫 번째 리스트의 첫 번째 요소를 출력
//         if (movies.isEmpty() && movies.get(0).isEmpty()) {
//             out.println("Movie list is empty.");
//         }
//     } else {
//         out.println("No movieList provided.");
//     }
	
	
// 	// 데이터를 문자열로 변환
// 	String jsonString = jsonBuffer.toString();
	
// 	// JSON 문자열을 자바 객체로 변환합니다.
// 	ObjectMapper objectMapper = new ObjectMapper();
	
	// JSON 문자열을 Map<String, Object>로 변환합니다.
// 	Map<String, Object> dataMap = objectMapper.readValue(jsonString, new TypeReference<Map<String, Object>>() {});
	
	
// 	// Map에서 리스트를 안전하게 캐스팅합니다.
//     List<String> getLocationList = (List<String>) dataMap.get("locationList");
//     List<String> getMovieList = (List<String>) dataMap.get("movieList");
	
// 	// 배열의 길이를 구합니다.
// 	int locationListSize = (getLocationList != null) ? locations.size() : 0;
// 	int movieListSize = (getMovieList != null) ? movies.size() : 0;
    
    if (locations.size() != 0) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
//         List<String> locationList = new ArrayList<>();
        int test = 0;

        try {
            conn = dbManager.getDBConnection();
            
       		String sqlQuery = null;
        	if(locations.size() == 1){
                if(movies.size() == 0){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE c.LOCATION_NAME = ? " +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    test++;
                } else if(movies.size() == 1){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE c.LOCATION_NAME = ? AND m.NAME = ?" +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, movies.get(0));
                    test++;
                } else if(movies.size() == 2){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE c.LOCATION_NAME = ? AND (m.NAME = ? OR m.NAME = ?)" +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, movies.get(0));
                    pstmt.setString(3, movies.get(1));
                    test++;
                } else if(movies.size() == 3){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE c.LOCATION_NAME = ? AND (m.NAME = ? OR m.NAME = ? OR m.NAME = ?)" +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, movies.get(0));
                    pstmt.setString(3, movies.get(1));
                    pstmt.setString(4, movies.get(2));
                    test++;
                }
        	} else if(locations.size() == 2){
                if(movies.size() == 0){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE (c.LOCATION_NAME = ? OR c.LOCATION_NAME = ?) " +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, locations.get(1));
                    test++;
                } else if(movies.size() == 1){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE (c.LOCATION_NAME = ? OR c.LOCATION_NAME = ?) AND m.NAME = ?" +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, locations.get(1));
                    pstmt.setString(3, movies.get(0));
                    test++;
                } else if(movies.size() == 2){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE (c.LOCATION_NAME = ? OR c.LOCATION_NAME = ?) AND (m.NAME = ? OR m.NAME = ?)" +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, locations.get(1));
                    pstmt.setString(3, movies.get(0));
                    pstmt.setString(4, movies.get(1));
                    test++;
                } else if(movies.size() == 3){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE (c.LOCATION_NAME = ? OR c.LOCATION_NAME = ?) AND (m.NAME = ? OR m.NAME = ? OR m.NAME = ?)" +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, locations.get(1));
                    pstmt.setString(3, movies.get(0));
                    pstmt.setString(4, movies.get(1));
                    pstmt.setString(5, movies.get(2));
                    test++;
                }
        	} else if(locations.size() == 3){
                if(movies.size() == 0){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE (c.LOCATION_NAME = ? OR c.LOCATION_NAME = ? OR c.LOCATION_NAME = ?) " +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, locations.get(1));
                    pstmt.setString(3, locations.get(2));
                    test++;
                } else if(movies.size() == 1){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE (c.LOCATION_NAME = ? OR c.LOCATION_NAME = ? OR c.LOCATION_NAME = ?) AND m.NAME = ?" +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, locations.get(1));
                    pstmt.setString(3, locations.get(2));
                    pstmt.setString(4, movies.get(0));
                    test++;
                } else if(movies.size() == 2){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE (c.LOCATION_NAME = ? OR c.LOCATION_NAME = ? OR c.LOCATION_NAME = ?) AND (m.NAME = ? OR m.NAME = ?)" +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, locations.get(1));
                    pstmt.setString(3, locations.get(2));
                    pstmt.setString(4, movies.get(0));
                    pstmt.setString(5, movies.get(1));
                    test++;
                } else if(movies.size() == 3){
                	sqlQuery = "SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c " +
                			"JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX) " +
                    		"WHERE (c.LOCATION_NAME = ? OR c.LOCATION_NAME = ? OR c.LOCATION_NAME = ?) AND (m.NAME = ? OR m.NAME = ? OR m.NAME = ?)" +
                    		"ORDER BY c.LOCATION_NAME, t.START_TIME ASC";
                    pstmt = conn.prepareStatement(sqlQuery);
                    pstmt.setString(1, locations.get(0));
                    pstmt.setString(2, locations.get(1));
                    pstmt.setString(3, locations.get(2));
                    pstmt.setString(4, movies.get(0));
                    pstmt.setString(5, movies.get(1));
                    pstmt.setString(6, movies.get(2));
                    test++;
                }
        	}
        	System.out.println( "location : " + locations + ", movie : " + movies + " get : " + test);
            rs = pstmt.executeQuery();
            List<Map<String, Object>> list = new ArrayList<>();
            
            while(rs.next()) {
            	
            	//test code
            	System.out.println(rs.getString("START_TIME"));
                System.out.println(rs.getString("END_TIME"));
                System.out.println(rs.getString("LOCATION_NAME"));
                System.out.println(rs.getString("ROOM_LOCATION"));
                System.out.println(rs.getString("NAME"));

                String startTime = rs.getString("START_TIME");
                String endTime = rs.getString("END_TIME");
                String locationName = rs.getString("LOCATION_NAME");
                String roomLocation = rs.getString("ROOM_LOCATION");
                String movieName = rs.getString("NAME");
                

                Map<String, Object> row = new HashMap<>();
                row.put("startTime", startTime);
                row.put("endTime", endTime);
                row.put("locationName", locationName);
                row.put("roomLocation", roomLocation);
                row.put("movieName", movieName);
                list.add(row);
            }
            
            // 리스트를 JSON으로 변환
            Gson gson = new Gson();
            String jsonData = gson.toJson(list);
            // 클라이언트로 JSON 데이터 전송
            
            System.out.println("jsonData : " + jsonData);
            
            response.setContentType("application/json; charset=UTF-8");
            response.getWriter().write(jsonData);
            response.getWriter().flush();
            response.getWriter().close();
            System.out.println("endProcess");
            
        /* SELECT c.LOCATION_NAME, c.ROOM_LOCATION, m.NAME, t.START_TIME, t.END_TIME FROM cinema c JOIN movie m ON c.MOVIE_IDX = m.MOVIEIDX
        		JOIN TIMETABLE t ON (c.LOCATION_NAME = t.LOCATION_NAME) and (c.ROOM_LOCATION = t.ROOM_LOCATION) AND (c.MOVIE_IDX = t.MOVIE_IDX)
        		WHERE (c.LOCATION_NAME = '강남' OR c.LOCATION_NAME = '강동') AND (m.NAME = '파일럿' OR m.NAME = '리볼버')
        		ORDER BY c.LOCATION_NAME, t.START_TIME ASC; */
        	
        } catch (Exception e) {
            e.printStackTrace();
            /* jsonResponse.put("error", "An error occurred while processing your request."); */
        } finally {
            dbManager.dbClose(conn, pstmt, rs);
            System.out.println("finalProcess");
        }
    } else {
        /* jsonResponse.put("error", "데이터없음"); */
    }
%>