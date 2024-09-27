<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DBManager.DBManager" %>

<%
	Connection conn = DBManager.getDBConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	String searchId = null;
	
	try {
		String sql = "SELECT id FROM MEMBER WHERE id = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			searchId = rs.getString(1);
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.dbClose(conn, pstmt, rs);
	}
	
	if(searchId == null) {
%>
	<script>
		alert('등록되지 않은 아이디입니다.');
		location.href='loginScreen.jsp';
	</script>
<%
	} else {
%>	
	<script>
		alert('<%= searchId %> 등록된 아이디입니다');
		location.href='loginScreen.jsp';
	</script>
<%
	}
%>
