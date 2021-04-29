<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz.jsp</title>
<style>
	table {
		border-collapse: collapse;
		border: 3px solid black;
	}
	td, th {
		border: 1px solid black;
		padding: 5px 10px;
		font-size: 20px;
	}
	th {
		background-color: #dadada;
	}
</style>
</head>
<body>

<h1>Member 테이블의 모든 내용 출력하기</h1>
<hr>

<jsp:useBean id="dao" class="day13.MemberDAO" />
<c:set var="list" value="${dao.memberList }" />

<table>
	<tr>
		<th>INDEX</th>
		<th>ID</th>
		<th>PASSWORD</th>
		<th>NAME</th>
		<th>AGE</th>
	</tr>
	<c:forEach var="member" items="${list }" varStatus="st">
	<tr>
		<td>${st.count }</td>
		<td>${member.id }</td>
		<td>${member.pw }</td>
		<td>${member.name }</td>
		<td>${member.age }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>