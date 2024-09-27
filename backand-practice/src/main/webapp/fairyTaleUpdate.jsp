<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DBManager.DBManager" %>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	
	System.out.println("writer -> " + writer);
	System.out.println("title -> " + title);
	System.out.println("content -> " + content);
	
	Connection conn = DBManager.getDBConnection();
	PreparedStatement pstmt = null;
	
	try{
		String sql = "UPDATE content SET title = ?, text = ? WHERE writer = '" + writer + "'";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);

		
		pstmt.executeUpdate();

	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.dbClose(conn, pstmt, null);
	}
%>
<script>
	alert('글이 성공적으로 수정되었습니다.');
	location.href='fairyTaleList.jsp';
</script>