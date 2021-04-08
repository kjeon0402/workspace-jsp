<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div>
	<form action=login-result.jsp>
		<input type="text" name="id" placeholder="ID" autofocus required autocomplete="off">
		<input type="password" name="pw" placeholder="Password" required>
		<input type="submit" value="Log In">
	</form>
</div>

</body>
</html>