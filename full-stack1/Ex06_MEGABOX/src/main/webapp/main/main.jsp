<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
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
	Gson gson = new Gson();

    // JSON 데이터 파싱
    JsonObject jsonObject = gson.fromJson(request.getReader(), JsonObject.class);

    // adultNumber 파라미터 추출
    String adultNumber = jsonObject.get("adultNumber").getAsString();

    // 받은 데이터 사용하기 (예: 콘솔에 출력)
    System.out.println("어른 수: " + adultNumber);
	//pageContext.forward("mainView.jsp");
%>