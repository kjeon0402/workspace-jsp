<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>

<form method="POST">
	<input type="text" name="name" placeholder="이름을 입력하세요">
	<input type="submit">
</form>

<%
	request.setCharacterEncoding("UTF-8");	// method="POST"인 경우
	String name = request.getParameter("name");
%>
<h3><%=name != null ? name : "" %></h3>

</body>
</html>