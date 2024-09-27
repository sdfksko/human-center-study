<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.CinemaServiceImpl"%>
<%@page import="com.example.demo.dto.CinemaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String location_name = request.getParameter("locationName");
	List<CinemaDTO> vo = CinemaServiceImpl.getInstance().selectLocationName(location_name);
	Gson gson = new Gson();
	out.println(gson.toJson(vo));
%>