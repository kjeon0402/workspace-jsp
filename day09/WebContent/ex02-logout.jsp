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
	session.invalidate();				// 현재 사용중인 세션을 무효화시킨다(id가 바뀔것)
	response.sendRedirect("ex02.jsp");
%>

</body>
</html>