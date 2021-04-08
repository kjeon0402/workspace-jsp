<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath() + "/quiz";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUIZ : 2021-04-08</title>
<link type="text/css" href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
</head>
<body>
<div>
	<header>
		<h1><a href="<%=root %>">welcome & welcome</a></h1>
		<nav>
			<ul>
				<li><a href="<%=root %>/join.jsp">회원가입</a></li>
				<li><a href="<%=root %>/login.jsp">로그인</a></li>
			</ul>
		</nav>
	</header>
</div>

