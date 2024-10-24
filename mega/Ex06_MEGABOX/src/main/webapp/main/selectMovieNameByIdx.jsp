<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.CinemaServiceImpl"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));
	String vo = CinemaServiceImpl.getInstance().selectMovieNameByIdx(movieIdx);
	Gson gson = new Gson();
	out.println(gson.toJson(vo));
%>