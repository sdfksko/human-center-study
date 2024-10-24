<%@page import="com.example.demo.service.ReviewServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="vo" class="com.example.demo.dto.ReviewDTO"/>
	<jsp:setProperty property="*" name="vo"/>
	<%
		ReviewServiceImpl.getInstance().insertReview(vo);
		response.sendRedirect("allMovieIdx.jsp?movieIdx="+vo.getMovieRef());
	%>
</body>
</html>