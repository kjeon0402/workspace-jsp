<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-form.jsp</title>
</head>
<body>

<h1>사용자 입력 데이터를 받아서 결과 페이지로 전송</h1>
<hr>

<form method='POST' action="ex01-submit.jsp">
	<p><input type="text" name="id" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="PASSWORD"></p>
	<p><input type="text" name="name" placeholder="USER NAME"></p>
	<p><input type="number" name="age" min="0" max="100" placeholder="AGE"></p>
	<p><input type="submit" value="전송"></p>
</form>

</body>
</html>