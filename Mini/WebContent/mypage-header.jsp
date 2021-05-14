<%@page import="menu.MenuDAO"%>
<%@page import="order.OrderDAO"%>
<%@page import="guest.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="guestDAO" value="<%=GuestDAO.getInstance() %>" />
<c:set var="orderDAO" value="<%=OrderDAO.getInstance() %>" />
<c:set var="menuDAO" value="<%=MenuDAO.getInstance() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	body {
		width: 100%;
		padding: 0;
		margin: 0;
		background-image: url('31845.png') !important; 
		background-size: 35%;
	}
	header {
		width: 100%;
		text-align: center;
		background-color: #FFE08C;
		color:rgb(155,97,88);
	}
	header > div {
		display: flex;
		justify-content: flex-end;
	}
	header > div > ul {
		padding: 0;
		display: flex;
		margin: 0;
	}
	header > div > ul > li {
		list-style: none;
		margin: 10px;
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
	form input[type="text"],
	form input[type="password"] {
		all: unset;
		border-bottom: 2px solid black;
		padding: 5px;
		margin: 5px;
		width: 200px;
	}
	form input[type="submit"] {
		box-sizing: border-box;
		all: unset;	
		font-size: 15px;
		width: 100px;
		margin: 5px;
		margin-top: 20px;
		padding: 5px 0;
		text-align: center;
		cursor: pointer;
		background-color: rgb(238,163,70);
		border-radius: 30px;
	}
	.mod-submit > a {
		font-size: 15px;
		width: 100px;
		margin: 5px;
		padding: 5px 5px;
		text-align: center;
		background-color: rgb(238,163,70);
		border-radius: 30px;
	}
</style>
</head>
<body>

<header>
	<h1><a href="${cpath }/order-list.jsp">MY PAGE</a></h1>
		<div>
			<ul>
				<li><a href="${cpath }/member/${not empty login ? 'headerlogout' : 'login'}.jsp">
					${not empty login ? '로그아웃' : '로그인' } </a></li>
				<li><a href="${cpath }">돌아가기</a></li>
			</ul>
		</div>
		<nav>
			<ul>
				<li><a href="${cpath }/menu/MainMenu.jsp">주문하기</a></li>
				<li><a href="${cpath }/order-list.jsp">주문내역</a></li>
				<li><a href="${cpath }/shopping-basket.jsp">장바구니</a></li>
				<li><a href="${cpath }/modify.jsp">회원 정보 수정</a></li>
				<li><a href="${cpath }/member/drop.jsp">회원 탈퇴</a></li>
			</ul>
		</nav>
</header>

</body>
</html>