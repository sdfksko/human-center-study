<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DBManager.DBManager" %>
    
    
<%
	String title = request.getParameter("content");
	String content = request.getParameter("text");
	String writer = request.getParameter("writer");

	Exception s = null;
	
	System.out.println(title);
	System.out.println(content);
	System.out.println(writer);
	
	Connection conn = DBManager.getDBConnection();	
	PreparedStatement pstmt = null;
	
	try{
		String insertSql = "INSERT INTO content VALUES(?, ?, ?)";
		
		pstmt = conn.prepareStatement(insertSql);
	
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, writer);
		
		pstmt.executeUpdate();	
%>

<%
	} catch(Exception e) {
		e.printStackTrace();
		s = e;
	} finally {
		DBManager.dbClose(conn, pstmt, null);
	}
%>
<script>
	alert('글이 성공적으로 등록되었습니다.');
	location.href='fairyTaleList.jsp';
</script>