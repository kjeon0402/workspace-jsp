<%@page import="guest.GuestDAO"%>
<%@page import="menu.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="menuDAO" value="<%=MenuDAO.getInstance()%>" />
<c:set var="guestDAO" value="<%=GuestDAO.getInstance() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		width : 100%;
		padding:0;
		margin: 0;
		background-image: url('31845.png') !important; 
		background-size: 35%;
		
	}
	.up {
		text-align: center;
		background-color: #FFE08C;
		color:rgb(155,97,88);
	}
	h1{
		height : 100px;
		padding-top: 20px;
		line-height:100px;
		display: flex;
		justify-content: center;
		padding: 0;
		margin: 0;
		background-color: rgb(238,163,70);
	}
	
	nav > ul {
		display: flex;
		justify-content: center;
		padding: 0;
		margin: 0;
		background-color: rgb(238,163,70);
	}
	nav > ul > li {
		list-style: none;
		width : 100%;
		line-height : 50px;
		height: 50px;
		font-size : 15;
		font-weight:bold;
		cursor: pointer;
	}
	nav > ul >li:hover {
		background-color: #FFE08C;
	}
	a {
		all: unset;
		color: inherit;
		display:block;
		cursor: pointer;
	}
		main {
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
		padding-top: 50px;
	}
	table {
		text-align: center;
		border: 1px solid black;
		background-color: rgb(238,163,70);
	}
	table td, th {
		border: 1px solid black;
		padding: 10px;
	}
	main {
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
		padding: 100px 0;
	}
	form {
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
		padding: 50px;
		background-color: #FFE08C;
		margin-left: 50px;
		border-radius: 30px;
	}
	
</style>
</head>
<body>
	<div class="up">
		<h1>관리자님 어서오세요</h1>
		<nav>
			<ul>
				<li><a href="${cpath }/Master/MemberList.jsp">회원정보</a></li>
				<li><a href="${cpath }/Master/MenuList.jsp">메뉴정보</a></li>
				<li><a href="${cpath }">홈</a></li>
			</ul>
		</nav>
	</div>
