<%@page import="com.example.demo.dto.MemberDTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession s = request.getSession();
	StringBuilder jsonData = new StringBuilder();
	String line = "";
	try (BufferedReader reader = request.getReader()) {
	    while ((line = reader.readLine()) != null) {
	        jsonData.append(line);
	    }
	}
	
	Gson gson = new Gson();
	MemberDTO member = gson.fromJson(jsonData.toString(),MemberDTO.class);
	if(member!=null) {
		if(member.isChk()){
			System.out.println("결과물 : "+member);
			Cookie cookie = new Cookie("id",member.getMemberId());
			cookie.setMaxAge(60*60*2);
			response.addCookie(cookie);
		}else{
			System.out.println("결과물2");
			Cookie cookie = new Cookie("id",null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			request.removeAttribute("id");
		}
		s.setAttribute("name", member.getName());
		s.setMaxInactiveInterval(2*60*60);
	}
	response.sendRedirect("main.jsp");
%>