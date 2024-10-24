<%@page import="com.example.demo.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.ReviewServiceImpl"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));			
	ReviewServiceImpl.getInstance().updateLike(type, reviewIdx);
	Gson gson = new Gson();
	ReviewDTO vo = ReviewServiceImpl.getInstance().selectByReviewIdx(reviewIdx);
	out.println(gson.toJson(vo));
%>