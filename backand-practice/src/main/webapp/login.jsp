<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DBManager.DBManager" %>
<%@ page import="java.sql.*" %>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	Connection conn = DBManager.getDBConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "SELECT COUNT(*) FROM MEMBER WHERE id = ? AND password = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		int count = rs.getInt(1);
%>
<% 
		if(count > 0) {
%>		
		<%
			session.setAttribute("userId", id);
		%>
			<script>
				alert('로그인에 성공하였습니다.');
				location.href='loginScreen.jsp';
			</script>
		<%
		}else {
		%>
			<script>
				alert('로그인에 실패하였습니다.');
				location.href='loginScreen.jsp';
			</script>
		<%
		}

	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.dbClose(conn, pstmt, rs);
	}
		%>			