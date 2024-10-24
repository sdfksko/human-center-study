<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.TimeTableServiceImpl"%>
<%@page import="com.example.demo.dto.TimeTableDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String location_name = request.getParameter("location_name");
	List<TimeTableDTO> vo = TimeTableServiceImpl.getInstance().selectTheaterFirst(location_name);
	Gson gson = new Gson();
	out.println(gson.toJson(vo));
%>