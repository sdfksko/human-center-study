<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DBManager.DBManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fairy Tale List</title>
<script defer src="./js/fairyTaleList.js"></script>
</head>
<body>

	<button onclick="insertTo()">등록</button>
	
	<%  
	    int currentPage = 1; // 기본 페이지 번호
	    int recordsPerPage = 10; // 한 페이지에 표시할 레코드 수
	    int totalPages = 0;
	    
	    if(request.getParameter("page") != null) {
	        try {
	            currentPage = Integer.parseInt(request.getParameter("page"));
	        } catch (NumberFormatException e) {
	            currentPage = 1; // 잘못된 페이지 번호가 들어오면 1로 설정
	        }
	    }
	    
	    Connection conn = DBManager.getDBConnection(); 
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int totalRecords = 0;
		
	    try {
	        // 전체 레코드 수를 가져오기 위한 쿼리
	        String countSql = "SELECT COUNT(*) AS count FROM content";
	        pstmt = conn.prepareStatement(countSql);
	        rs = pstmt.executeQuery();
	        
	        if(rs.next()) {
	            totalRecords = rs.getInt("count");
	        }
	        
	        totalPages = (int)Math.ceil(totalRecords * 1.0 / recordsPerPage);
	        
	        // currentPage가 범위를 벗어나면 수정
	        if (currentPage < 1) {
	            currentPage = 1;
	        } else if (currentPage > totalPages && totalPages > 0) {
	            currentPage = totalPages;
	        }

	        int start = (currentPage - 1) * recordsPerPage + 1;
	        int end = start + recordsPerPage - 1;

	        // 실제 데이터를 가져오기 위한 쿼리
	        String selectSql = "SELECT * FROM ( " +
	                           "SELECT ROWNUM AS rnum, title, text, writer FROM ( " +
	                           "SELECT title, text, writer FROM content ORDER BY title) " +
	                           "WHERE ROWNUM <= ? ) " +
	                           "WHERE rnum >= ?";

	        pstmt = conn.prepareStatement(selectSql);
	        pstmt.setInt(1, end);
	        pstmt.setInt(2, start);

	        rs = pstmt.executeQuery();

	        while(rs.next()) {
	%>
	    <div>
	        <span><%= rs.getString("title") %></span>
	        <span><%= rs.getString("text") %></span>
	        <span><%= rs.getString("writer") %></span>
	        <button onclick="updateTo('<%= rs.getString("title") %>')">수정</button>
	        <button onclick="deleteTo('<%= rs.getString("title") %>')">삭제</button>
	    </div>
	<%
	        }
	    } catch(Exception e) {
	         e.printStackTrace();
	    } finally {
	        DBManager.dbClose(conn, pstmt, rs);
	    }
	%>

	<!-- 페이징 네비게이션 -->
	<%
	    if(totalPages > 0) {  // totalPages가 0보다 큰 경우에만 네비게이션 표시
	%>
	    <div>
	        <% if(currentPage > 1) { %>
	            <a href="?page=1">처음</a>
	            <a href="?page=<%= currentPage - 1 %>">이전</a>
	        <% } %>

	        <% for(int i = 1; i <= totalPages; i++) { %>
	            <a href="?page=<%= i %>"><%= i %></a>
	        <% } %>

	        <% if(currentPage < totalPages) { %>
	            <a href="?page=<%= currentPage + 1 %>">다음</a>
	            <a href="?page=<%= totalPages %>">끝</a>
	        <% } %>
	    </div>
	<%
	    }
	%>

</body>
</html>
