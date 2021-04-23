<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book List Management</title>
<style>
body, div, span, p, ul, li, header, nav, main {
	margin: 0;
	padding: 0;
}
body {
	width: 100%;
	overflow-x: hidden;
}
a {
	color: inherit;
	text-decoration: none;
}
header {
	display: flex;
	flex-flow: column;
	justify-content: center;
	align-items: center;
	background-color: black;
	color: white;
}
header > .login-info {
	display: flex;
	justify-content: flex-end;
	width: 100%;
	height: 35px;
	padding-right: 10px;
}
nav {
	background-color: #333;
	width: 100%;
	display: flex;
	justify-content: center;
}
nav > ul {
	list-style: none;
	display: flex;
}
nav > ul > li {
	display: block;
	font-size: 20px;
}
nav > ul > li > a {
	padding: 5px 20px;
	display: block;
	font-weight: bold;
}
nav > ul > li > a:hover {
	color: #0ff;
}
main {
	padding-top: 50px;
	display: flex;
	flex-flow: column;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>

<header>
	<h1><a href="${cpath }">도서 관리 프로그램</a></h1>
	<div class="login-info">
		<c:if test="${not empty login }">
			<strong>${login.name }</strong>(${login.id })
		</c:if>
		
	</div>
	<nav>
		<ul>
			<li><a href="${cpath }/join.jsp">회원가입</a></li>
			<li><a href="${not empty login ? 'logout' : 'login' }.jsp">${not empty login ? '로그아웃' : '로그인' }</a></li>
			<li><a href="${cpath }/list.jsp">목록</a></li>
			<li><a href="${cpath }/add.jsp">추가</a></li>
		</ul>
	</nav>
</header>

</body>
</html>