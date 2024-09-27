<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="./js/login.js"></script>
</head>
<body>
<% 
	String id = (String)session.getAttribute("userId");
	
		if(id !=null) {
%>
		<div><%= id %> 님 환영합니다</div>
		<button onclick="logout()">로그아웃</button>
		<button onclick="location.href='test.jsp'">테스트파일로가기</button>
	<%
		} else {
	%>	
		<button onclick="loginForm()">로그인</button>
		<button onclick="location.href='idSearchForm.jsp'">아이디찾기</button>
	<button onclick="location.href='passwordSearchForm.jsp'">비밀번호찾기</button>
	<%
		}
	%>
</body>
</html>