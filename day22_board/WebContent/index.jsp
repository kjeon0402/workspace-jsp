<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h1>대문 페이지</h1>

<main>
<table>
	<tr>
		<th>IDX</th>
		<th>ID</th>
		<th>PW</th>
		<th>NAME</th>
		<th>EMAIL</th>
		<th>PHONE NUMBER</th>
	</tr>
	<c:forEach var="dto" items="${account.memberList() }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.id }</td>
			<td>${dto.pw }</td>
			<td>${dto.name }</td>
			<td>${dto.email }</td>
			<td>${dto.pnum }</td>
		</tr>
	</c:forEach>
</table>
</main>

</body>
</html>