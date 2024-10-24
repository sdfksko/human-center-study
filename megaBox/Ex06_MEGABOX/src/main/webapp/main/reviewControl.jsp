<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.ReviewServiceImpl"%>
<%@page import="com.example.demo.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	int movieRef = Integer.parseInt(request.getParameter("movieRef"));
	List<ReviewDTO> vo = ReviewServiceImpl.getInstance().selectType(type, movieRef);
	Gson gson = new Gson();
	out.println(gson.toJson(vo));
%>