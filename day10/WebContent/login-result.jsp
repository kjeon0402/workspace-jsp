<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="day10.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1><a style="text-decoration: none; color: chocolate;" href="${cpath }/quiz.jsp">LOGIN</a></h1>
<hr>
<h2 style="text-align: center">${login.name } (${login.id })</h2>
<div style="display: flex; justify-content:center;">
	<a href="${cpath }/quiz-logout.jsp"><button>로그아웃</button></a>
</div>
</body>
</html>