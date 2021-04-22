<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
<style>
	body {
		witdh: 100%;
		padding 0;
		margin 0;
	}
	.wrap {
		width: 100%;
		display: flex;
		justify-content: center;
		background-color: black;
	}
	header {
		text-align: center;
	}
	a {
		text-decoration: none;
		color: white;
	}
	.navi {
		list-style: none;
		display: flex;
		justify-content: center;
		padding: 0;
	}
	.navi > li {
		padding: 10px 5px;
	}
	.nani > li > a:hover {
		background-color: white;
		color: black;
	}
</style>
</head>
<body>
<div class="wrap">
<header>
	<h1><a href="${cpath }">대문페이지</a></h1>
	<nav>
		<ul class="navi">
			<li><a href="${cpath }/join.jsp">회원가입</a></li>
			<li><a href="${cpath }/login.jsp">로그인</a></li>
			<li><a href="">정보수정</a></li>
			<li><a href="">회원탈퇴</a></li>
		</ul>
	</nav>
</header>
</div>

</body>
</html>