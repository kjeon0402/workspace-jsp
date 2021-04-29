<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
<h2>DROP MEMBERSHIP</h2>
<c:if test="${empty login }">
	<script>
		alert('로그인이 필요한 페이지입니다.');
		location.href = '${cpath }/login.jsp';
	</script>
</c:if>

<c:if test="${not empty login }">
	<c:set var="row" value="${dao.dropMember(login.idx) }" />
	<c:remove var="login" scope="session" />
	<c:redirect url="/" />
</c:if>

</main>
</body>
</html>