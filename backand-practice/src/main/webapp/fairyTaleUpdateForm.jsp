<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DBManager.DBManager" %>
<%
	String name = request.getParameter("title");

	Connection conn = DBManager.getDBConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String title = null;
	String content = null;
	String writer = null;
	
	try{
		String sql = "SELECT * FROM content WHERE title = '" + name + "'";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			title = rs.getString("TITLE");
			content = rs.getString("TEXT");
			writer = rs.getString("WRITER");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.dbClose(conn, pstmt, rs);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>defer src="./js/"</script>
</head>
<body>
	<form action="fairyTaleUpdate.jsp" method="post">
		<input type="text" name="title" value="<%= title %>" />
		<textarea name="content"><%= content %></textarea>
		<input type="text" name="writer" value="<%= writer %>">
		<input type="submit" value="수정" >
	</form>
</body>
</html>