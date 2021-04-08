<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div>
<form action="join-result.jsp">
		<p><h4>Join Page</h4></p>
		<p><input type="text" name="id" placeholder="ID"></p>
		<p><input type="password" name="pw" placeholder="Password"></p>
		<p><input type="password" name="checkPw" placeholder="Password Check"></p>
		<p><input type="text" name="name" placeholder="Name"></p>
		<p><input type="text" name="birth" placeholder="birth : 0000-00-00"></p>
		<p><select name="gender">
			<option>-----</option>
			<option>male</option>
			<option>female</option>
		</select></p>
		<p><input type="submit" value="JOIN"></p>
	</form>
</div>

</body>
</html>