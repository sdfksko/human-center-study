<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.TimeTableServiceImpl"%>
<%@page import="com.example.demo.dto.TimeTableDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String movieName = request.getParameter("name");
	String locationName = request.getParameter("locationName");
	List<TimeTableDTO> vo = TimeTableServiceImpl.getInstance().selectTicketing(movieName, locationName);
	Gson gson = new Gson();
	out.println(gson.toJson(vo));
%>