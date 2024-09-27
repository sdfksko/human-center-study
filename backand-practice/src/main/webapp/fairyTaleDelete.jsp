<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DBManager.DBManager" %>
<%	
	String title = request.getParameter("title");	
	System.out.println(title);	

	Connection conn = DBManager.getDBConnection();
	PreparedStatement pstmt = null;
	
	try{
		String sql = "DELETE FROM content WHERE title = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.dbClose(conn, pstmt, null);
	}
%>
<script>
	alert('글이 삭제되었습니다');
	location.href='fairyTaleList.jsp';
</script>

