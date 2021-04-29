<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
<c:if test="${not empty login }">
	<form method="POST" action="update-submit.jsp">
		<p>
			<input type="hidden" name="userid" value="${login.userid }">
			<strong>${login.userid }</strong>
		</p>
		<p><input type="text" name="username" value="${login.username }" placeholder="NAME"></p>
		<p><input type="number" name="age" value="${login.age }" placeholder="AGE"></p>
		<p>
			<label><input type="radio" name="gender" value="남성" ${login.gender == '남성' ? 'checked' : '' }>MALE</label>
			<label><input type="radio" name="gender" value="여성" ${login.gender == '여성' ? 'checked' : '' }>FEMALE</label>
		</p>
		<p><input type="submit" value="UPDATE">
	</form>
</c:if>

<c:if test="${empty login }">
	<script>
		alert('로그인이 필요한 메뉴입니다.');
		location.href = '${cpath }/login.jsp';
	</script>
</c:if>
</main>

</body>
</html>