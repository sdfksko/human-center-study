<%@page import="com.example.demo.service.NoticeServiceImpl"%>
<%@page import="com.example.demo.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include.jsp" %>
<%
	NoticeDTO vo = NoticeServiceImpl.getInstance().selectByIdx(idx);
	NoticeDTO next = NoticeServiceImpl.getInstance().selectPrevAndNext("plus", idx);
	NoticeDTO prev = NoticeServiceImpl.getInstance().selectPrevAndNext("minus", idx);
	request.setAttribute("vo", vo);
	request.setAttribute("currentPage", p);
	request.setAttribute("prev", prev);
	request.setAttribute("next", next);
	pageContext.forward("noticeDetailView.jsp");
%>