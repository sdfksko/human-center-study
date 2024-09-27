<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String logout = request.getParameter("logout");
		if(logout != null) {
			session.removeAttribute("userId");
		}
	%>	
	<script>
		alert('로그아웃되었습니다.');
		location.href='loginScreen.jsp';
	</script>
</body>
</html>