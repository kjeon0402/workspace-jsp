<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
</head>
<body>

<h1>memberList.jsp</h1>
<hr>
<form method="POST">
	<p><input type="text" name="id" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="PASSWORD"></p>
	<p><input type="submit" value="LOGIN"></p>
</form>

<table border="1" cellpadding="10" cellspacing="0")>
	<thead>
		<tr>
			<th>IDX</th>
			<th>ID</th>
			<th>PW</th>
			<th>NAME</th>
			<th>EMAIL</th>
			<th>PNUM</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.id }</td>
			<td>${dto.pw }</td>
			<td>${dto.name }</td>
			<td>${dto.email }</td>
			<td>${dto.pnum }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>