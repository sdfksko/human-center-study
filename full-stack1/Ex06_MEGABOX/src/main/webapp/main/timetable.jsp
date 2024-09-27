<%@page import="com.example.demo.service.MovieServiceImpl"%>
<%@page import="com.example.demo.dto.MovieDTO"%>
<%@page import="com.example.demo.calendar.Calendar"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="com.example.demo.calendar.CalendarDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LocalDateTime ldt = LocalDateTime.now();
	List<CalendarDTO> dto = Calendar.prn(ldt.getYear(),ldt.getMonthValue(),ldt.getDayOfMonth());
	List<MovieDTO> movieVO = MovieServiceImpl.getInstance().select();
	request.setAttribute("vo", dto);
	request.setAttribute("movieVO", movieVO);
	pageContext.forward("timetableView.jsp");
%>