<%@page import="com.example.demo.service.MovieServiceImpl"%>
<%@page import="com.example.demo.dto.MovieDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	List<MovieDTO> vo = MovieServiceImpl.getInstance().selectMovieName(name);
	request.setAttribute("vo", vo);
	pageContext.forward("allMovieView.jsp");
%>