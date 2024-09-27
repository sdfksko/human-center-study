<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.MovieServiceImpl"%>
<%@page import="com.example.demo.dto.MovieDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	List<MovieDTO> vo = MovieServiceImpl.getInstance().selectMovieName(name);
	Gson gson = new Gson();
	out.println(gson.toJson(vo));
%>