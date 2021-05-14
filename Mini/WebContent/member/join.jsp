<%@page import="order.OrderDAO"%>
<%@page import="guest.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="guestDAO" value="<%=GuestDAO.getInstance()%>" />
<c:set var="orderDAO" value="<%=OrderDAO.getInstance() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<style>
	body {
		width: 100%;
		padding: 0;
		margin: 0;
		background-image: url('../31845.png');
		background-size: 35%;
	}
	main {
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
		padding: 15% 0;
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
		font-size: 20px;
		width: 210px;
		margin: 5px;
		margin-top: 20px;
		padding: 5px 0;
		text-align: center;
		cursor: pointer;
		background-color: rgb(238,163,70);
		border-radius: 30px;
	}
</style>
</head>
<body>
<main>
<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<h2>회원 가입</h2>
		<p><input type="text" name="id" placeholder="ID"></p>
		<p><input type="password" name="pw" placeholder="PASSWORD"></p>
		<p><input type="text" name="name" placeholder="NAME"></p>
		<p><input type="text" name="address" placeholder="ADDRESS"></p>
		<p><input type="text" name="card" placeholder="CARD NUM : oooo-oooo-oooo"></p>
		<p><input type="password" name="cardpw" placeholder="CARD PASSWORD"></p>
		<p><input type="submit" value="회원 가입"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="inputData" class="guest.GuestDTO" />
	<jsp:setProperty property="*" name="inputData"/>
	<c:set var="row" value="${guestDAO.join(inputData) }" />
	1234 : ${row }
	<script>
		const row = ${row};
		alert('회원 가입 ' + (row == 1 ? '성공' : '실패'));
		location.href = '${cpath}' + (row == 1 ? '' : '/member/join.jsp');
	</script>
</c:if>
</main>

</body>
</html>