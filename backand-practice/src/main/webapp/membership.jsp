<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DBManager.DBManager" %>

<%	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	Connection conn = DBManager.getDBConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		// 아이디 중복 체크 쿼리
		String checkSql = "SELECT COUNT(*) FROM MEMBER WHERE ID = ?";
		pstmt = conn.prepareStatement(checkSql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		rs.next();
		int count = rs.getInt(1);
		
		if(count > 0) {
%>
			<script>
				alert('회원가입이 실패하였습니다. 이미 존재하는 아이디입니다.');
				location.href='membershipForm.jsp';
			</script>
<%
		} else {
			// 아이디 중복이 없으면 INSERT 쿼리 실행
			String sql = "INSERT INTO MEMBER (ID, PASSWORD) VALUES(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			pstmt.executeUpdate();
%>
			<script>
				alert('회원가입이 성공하였습니다.');
				location.href='membershipForm.jsp';
			</script>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.dbClose(conn, pstmt, rs);
	}
%>
