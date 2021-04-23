<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<h2>회원 가입</h2>
<form method='POST' action="join-submit.jsp">
	<p><input type="text" name="id" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="PASSWORD"></p>
	<p><input type="text" name="name" placeholder="USER NAME"></p>
	<p><input type="number" name="age" min="0" max="100" placeholder="AGE"></p>
	<p><input type="submit" value="JOIN"></p>
</form>

</body>
</html>