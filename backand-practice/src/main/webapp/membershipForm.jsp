<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>defer src="./js/membership.js"</script>
</head>
<body>
	<form action="./membership.jsp" method="post">
		<input type="text" name="id" placeholder="아이디">
		<input type="password" name="password" placeholder="비밀번호">
		<input type="submit" value="회원가입" onclick="membershipTo()">
	</form>
</body>
</html>