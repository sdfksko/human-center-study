<%@page import="com.dbManager.dbManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%
	
	Connection conn = null;
    PreparedStatement pstmt = null;
	
	String id = request.getParameter("userId");
    String password = request.getParameter("userPassword");
    String name = request.getParameter("userName");
    String phonenumber = request.getParameter("userPhonenumber");
    String mail = request.getParameter("userEmail");
/* 
   	if (id.trim() == "" || id == null){
   	} else if (password.trim() == "" || id == null){

   	} else if (name.trim() == "" || id == null){
   		   		
   	} else if (mail.trim() == "" || id == null){
   		
   	} */

    try{
        conn = dbManager.getDBConnection();
        conn.setAutoCommit(false);

        String sqlQury = "INSERT INTO MEMBER (memberid, password, name, phonenumber, email) " +
                "values(?, ?, ?, ?, ?)";

        pstmt = conn.prepareStatement(sqlQury);
        pstmt.setString(1, id);
        pstmt.setString(2, password);
        pstmt.setString(3, name);
        pstmt.setString(4, phonenumber);
        pstmt.setString(5, mail);
        int rowsAffected = pstmt.executeUpdate();
        

        if (rowsAffected > 0) {
            conn.commit(); // 데이터 삽입 성공, 커밋
        } else {
            conn.rollback(); // 데이터 삽입 실패, 롤백
        }
    } catch (Exception e) {

        if (conn != null) {
            try {
                conn.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        }

        e.printStackTrace();
    } finally {
        dbManager.dbClose(conn, pstmt, null);
        response.sendRedirect("/Ex06_MEGABOX/main/main.jsp");
    }
%>