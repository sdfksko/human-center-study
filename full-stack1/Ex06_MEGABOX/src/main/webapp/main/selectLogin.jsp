<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.MemberServiceImpl"%>
<%@page import="com.example.demo.dto.MemberDTO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = request.getParameter("memberId");
	MemberDTO vo = MemberServiceImpl.getInstance().selectLogin(memberId);
	Gson gson = new Gson();
	out.println(gson.toJson(vo));
%>