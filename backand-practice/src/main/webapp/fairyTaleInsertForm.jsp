<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="./js/fairyTaleList.js"></script>
</head>
<body>
	<form action="fairyTaleInsert.jsp" method="post">
		<input type="text" name="content">
		<textArea name='text'></textArea>
		<input type='text' name="writer">
		<input onclick="insertForm()" type="submit" value="등록">
	</form>
</body>
</html>