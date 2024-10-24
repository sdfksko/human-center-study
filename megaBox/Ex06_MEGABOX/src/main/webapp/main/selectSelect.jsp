<%@page import="com.example.demo.dto.MovieDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.MovieServiceImpl"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String openingDate = request.getParameter("openingDate");
	String name = request.getParameter("name");
	HashMap<String,Object> map = MovieServiceImpl.getInstance().selectTicketing(openingDate, name);
	List<MovieDTO> vo = MovieServiceImpl.getInstance().selectMovieName(name);
	map.put("image", vo.get(0).getImage());
	Gson gson = new Gson();
	out.println(gson.toJson(map));
%>