<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.example.demo.service.MovieServiceImpl"%>
<%@page import="com.example.demo.dto.MovieDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.example.demo.dto.MemberDTO"%>
<%@page import="com.example.demo.service.NoticeServiceImpl"%>
<%@page import="com.example.demo.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int total = NoticeServiceImpl.getInstance().selectCount(null, "all");
	NoticeDTO vo = NoticeServiceImpl.getInstance().selectByIdx(total);
	HttpSession s = request.getSession();
	String id = "";
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("id")){
				id=cookie.getValue();
				request.setAttribute("id", id);
			}
		}
	}
	List<MovieDTO> movie = MovieServiceImpl.getInstance().select();
	request.setAttribute("vo", vo);
	request.setAttribute("movie", movie);
	
	
	
	
	
	pageContext.forward("mainView.jsp");
	
%>