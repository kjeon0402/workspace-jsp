<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h2>JOIN</h2>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input type="text" name="id" placeholder="ID"></p>
		<p><input type="password" name="pw" placeholder="PASSWORD"></p>
		<p><input type="text" name="name" placeholder="NAME"></p>
		<p><input type="text" name="email" placeholder="EMAIL"></p>
		<p><input type="text" name="pnum" placeholder="PHONE NUMBER"></p>
		<p><input type="submit" value="JOIN"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="inputData" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="inputData"/>
	<c:set var="row" value="${account.joinMember(inputData) }" />
	<script>
		const row = ${row };
		alert('회원가입 ' + (row == 1) ? '성공' : '실패');
		location.href = '${cpath }' + (row == 1) ? 'login.jsp' : 'join.jsp';
	</script>
</c:if>

</body>
</html>