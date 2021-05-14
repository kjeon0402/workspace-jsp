<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypage-header.jsp" %>

<main>
<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input type="text" name=id value="${login.id }" placeholder="ID"></p>
		<p><input type="password" name="pw" placeholder="PASSWORD"></p>
		<p><input type="submit" value="확인"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<c:if test="${param.pw == login.pw }">
		<c:redirect url="/member/changepw-result.jsp" />
	</c:if>
	
	<c:if test="${parma.pw != login.pw }">
		<script>
			alert('정보가 일치하지 않습니다.');
			location.href = '${cpath}/member/changepw.jsp';
		</script>
	</c:if>
</c:if>

</main>

</body>
</html>