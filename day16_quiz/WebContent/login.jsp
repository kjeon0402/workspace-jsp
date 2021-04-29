<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
	<form method="POST" action="login-submit.jsp">
		<p><input type="text" name="userid" placeholder="ID"></p>
		<p><input type="password" name="userpw" placeholder="PASSWORD"></p>
		<p><input type="submit" value="LOGIN">
	</form>
</main>

</body>
</html>