<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
	<h2>JOIN</h2>
	<form method="POST" action="join-submit.jsp">
		<p><input type="text" name="userid" placeholder="ID"></p>
		<p><input type="password" name="userpw" placeholder="PASSWORD"></p>
		<p><input type="text" name="username" placeholder="NAME"></p>
		<p>
			<label><input type="radio" name="gender" value="남성">MALE</label>
			<label><input type="radio" name="gender" value="여성">FEMALE</label>
		</p>
		<p><input type="number" name="age" min="0" max="100" placeholder="AGE"></p>
		<p><input type="date" name="date"></p>
		<%--
				1. 사용자에게 입력받지 않고 sysdate로 처리한다
				2. 사용자에게 입력받지 않고 new Date()로 처리한다
				3. SimpleDateFormat의 parse(String source) 메서드를 이용하여 문자열을 Date로 변환
		 --%>
		<p><input type="submit" value="JOIN"></p>
	</form>
</main>

</body>
</html>