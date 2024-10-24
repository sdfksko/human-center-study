<%@page import="com.example.demo.service.MovieServiceImpl"%>
<%@page import="com.example.demo.dto.MovieDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));
	MovieDTO vo = MovieServiceImpl.getInstance().selectByIdx(movieIdx);
	request.setAttribute("vo", vo);
	pageContext.forward("allMovieIdxView.jsp");
%>