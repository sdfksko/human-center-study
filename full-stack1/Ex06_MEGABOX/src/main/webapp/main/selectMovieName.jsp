<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.TimeTableServiceImpl"%>
<%@page import="com.example.demo.dto.TimeTableDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String location_name = request.getParameter("location_name");
	int movie_idx = Integer.parseInt(request.getParameter("movie_idx"));
	String room_location = request.getParameter("room_location");
	String type = request.getParameter("type");
	String time = request.getParameter("time");
	List<TimeTableDTO> vo = TimeTableServiceImpl.getInstance().selectMovieName(type,location_name, movie_idx, room_location,time);
	Gson gson = new Gson();
	out.println(gson.toJson(vo));
%>