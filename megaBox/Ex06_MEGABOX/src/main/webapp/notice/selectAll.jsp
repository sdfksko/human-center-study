<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.demo.service.NoticeServiceImpl"%>
<%@page import="com.example.demo.dto.NoticeDTO"%>
<%@page import="com.example.demo.dto.PagingVO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.jsp" %>
<%
	List<NoticeDTO> pv = NoticeServiceImpl.getInstance().selectAll(p,s,name,title);
	Gson gson = new Gson();
	HashMap<String,Object> map = new HashMap<>();
	map.put("list",pv);
	map.put("title",title);
	map.put("type",name);
	map.put("total",NoticeServiceImpl.getInstance().selectCount(title,name));
	out.println(gson.toJson(map));
%>