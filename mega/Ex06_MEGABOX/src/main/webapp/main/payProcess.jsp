<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StringBuilder sb = new StringBuilder();
	String st = "";
	BufferedReader br = request.getReader();
	while((st=br.readLine())!=null)sb.append(st);
	
	if(!sb.isEmpty()){
		Gson gson = new Gson();
		HashMap<String,Object> map = gson.fromJson(sb.toString(), new TypeToken<HashMap<String,Object>>(){}.getType());
		System.out.println("결과물2 : " + map);
		session.setAttribute("map", map);
	}
%>