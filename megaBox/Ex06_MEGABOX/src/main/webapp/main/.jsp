<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.CinemaServiceImpl"%>
<%@page import="com.example.demo.dto.CinemaDTO"%>
<%@page import="com.example.demo.dto.MovieDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String location_name = request.getParameter("location_name");
	List<CinemaDTO> vo = CinemaServiceImpl.getInstance().selectRoomLocation(name, location_name);
	Gson gson = new Gson();
	out.println(gson.toJson(vo));
%>