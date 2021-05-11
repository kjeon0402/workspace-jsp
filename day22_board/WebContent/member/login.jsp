<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h2>LOGIN</h2>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input type="text" name="id" placeholder="ID"></p>
		<p><input type="password" name="pw" placeholder="PASSWORD"></p>
		<p><input type="submit" value="LOGIN"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="inputData" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="inputData"/>
	<c:set var="login" value="${account.loginMember(inputData) }" scope="session" />
	<script>
		const flag = ${not empty login};
		if(flag) {
			location.href = "${cpath }";
		} else {
			alert('로그인 실패');
			history.go(-1);
		}
	</script>
</c:if>

</body>
</html>