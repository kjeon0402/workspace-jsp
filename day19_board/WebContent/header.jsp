<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day19 - board</title>
<style>
	.login-info {
		text-align: right;
		width: 100%;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	/* board */
	table {
		border-collapse: collapse;
		border: 0px solid black;
		width: 90%;
	}
	tr {
		border: 0;
		border-bottom: 1px solid black;
		cursor: pointer;
	}
	tbody > tr:hover {
		background-color: #dadada;
	}
	.content-img {
		width: 300px;
		height: 240px;
		background-size: 200px;
		background-position: center center;
		background-repeat: no-repeat;
	}
	.sb {
		width: 100%;
		display: flex;
		justify-content: space-between;
	}
	.content {
		border: 2px solid #dadada;
		padding: 10px;
		min-height: 400px;
		margin: 10px 0;
	}
	.down-menu {
		width: 90%;
		margin: 10px 0;
	}
	textarea {
		all: unset;
		resize: none;
		padding: 10px;
		width: 90%;
		height: 350px;
	}
</style>
<link rel="stylesheet" href="${cpath }/css/style.css">
</head>
<body>
<c:set var="dao" value="<%=BoardDAO.getInstance() %>" />
<%-- EL TAG는 JSP 내장 객체 안에 있는 attribute(object)를 대상으로 한다 --%>
<header>
	<h1><a href="${cpath }">day19 - board</a></h1>
	<div class="login-info">
		로그인 정보
	</div>
	<nav>
		<ul>
			<li><a href="">회원가입</a></li>
			<li><a href="">로그인</a></li>
			<li><a href="${cpath }/board/list.jsp">게시판</a></li>
		</ul>
	</nav>
</header>
<hr>