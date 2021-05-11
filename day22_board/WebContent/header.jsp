<%@page import="member.MemberDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day22 - board</title>
<style>
	.login-info {
		text-align: right;
		width: 100%;
		height: 30px;
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
	.reply {
		background-color: #5e5e5e;
	}
	.reply-form {
		width: 100%;
		display: flex;
		justify-content: center;
	}
	.reply textarea {
		width: 500px;
		height: 50px;
		background-color: white;
	}
</style>
<link rel="stylesheet" href="${cpath }/css/style.css">
</head>
<body>
<c:set var="dao" value="<%=BoardDAO.getInstance() %>" />
<c:set var="account" value="<%=MemberDAO.getInstance() %>" />
<%-- EL TAG는 JSP 내장 객체 안에 있는 attribute(object)를 대상으로 한다 --%>
<header>
	<h1><a href="${cpath }">day19 - board</a></h1>
	<div class="login-info">
		<c:if test="${not empty login }">
			<strong>${login.name }</strong>(${login.id })
		</c:if>
	</div>
	<nav>
		<ul>
			<li><a href="${cpath }/member/join.jsp">회원가입</a></li>
			<li><a href="${cpath }/member/${not empty login ? 'logout' : 'login' }.jsp">${not empty login ? '로그아웃' : '로그인' }</a></li>
			<li><a href="${cpath }/board/list.jsp?page=1">게시판</a></li>
		</ul>
	</nav>
</header>
<hr>