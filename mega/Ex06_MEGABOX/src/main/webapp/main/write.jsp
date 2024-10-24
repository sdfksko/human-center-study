<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "com.dbManager.dbManager" %>
<%
	
    int score = Integer.parseInt(request.getParameter("score"));
    String content = request.getParameter("review");
    int movieIdx = Integer.parseInt(request.getParameter("number"));
    String name = (String)session.getAttribute("name");
    
    System.out.println(session.getAttribute("name"));
    
	System.out.println(score);
	System.out.println(content);
	System.out.println(movieIdx);
	
    Connection conn = dbManager.getDBConnection();
    PreparedStatement pstmt = null;
    
    System.out.println(conn);
    
    Exception exception = null;
    try {
        String InsertSql = "INSERT INTO REVIEW(REVIEWIDX, TITLE, REVIEWLIKE, MOVIEREF, REGDATE, USERID, MOVIELIKE)" +
    						"VALUES(REVIEWIDX.NEXTVAL, ?, 0, ?, sysdate, ?, ?)";
        pstmt = conn.prepareStatement(InsertSql);

        pstmt.setString(1, content);
        pstmt.setInt(2, movieIdx);
        pstmt.setString(3, name);
        pstmt.setInt(4, score);

        pstmt.executeUpdate();
       
    } catch (Exception e) {
        exception = e;
        e.printStackTrace();
    } finally {
    	dbManager.dbClose(conn, pstmt, null);
    }
%>

<%
    if(exception == null) {
%>
<script>
    alert('관람평이 정상적으로 등록되었습니다.');
    window.location.href = "/Ex06_MEGABOX/main/allMovieIdx.jsp?movieIdx=<%= movieIdx %>";
</script>
<%
    } else {
%>
<script>
    alert('관람평 등록 중 오류가 발생했습니다.');
</script>
<%
    }
%>