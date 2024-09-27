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
	<form action="login.jsp" method="post">
		<input type="text" name="id" placeholder="아이디">
		<input type="password" name="password" placeholder="비밀번호">
		<input type="submit" value="로그인" onclick="loginAccess()">
	</form>
</body>
</html>