<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="day16_quiz.MemberDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEADER</title>
<style>
	a {
		text-decoration: none;
	}
</style>
</head>
<body>

<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<c:set var="dao" value="<%=MemberDAO.getInstance() %>" />

<header>
	<h1><a href="${cpath }">LOGO</a></h1>
	<div>
		<c:if test="${not empty login }">
			<strong>${login.username }</strong>(${login.userid })
		</c:if>
	</div>
	<nav>
		<ul>
			<li><a href="${cpath }/join.jsp">JOIN</a></li>
			<li>
				<a href="${cpath }/${not empty login ? 'logout' : 'login' }.jsp">
					${not empty login ? 'LOGOUT' : 'LOGIN' }
				</a>
			</li>
			<li><a href="${cpath }/update.jsp">MODIFY</a></li>
			<li><a href="${cpath }/drop.jsp">DROP</a></li>
		</ul>
	</nav>
</header>

</body>
</html>