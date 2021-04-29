<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="inputData" class="day16_quiz.MemberDTO" />
<jsp:setProperty property="*" name="inputData" />

<c:set var="login" value="${dao.loginMember(inputData) }" scope="session" />

<c:if test="${not empty login }">
	<c:redirect url="/" />
</c:if>

<c:if test="${empty login }">
	<script>
		alert('정보가 일치하지 않습니다.')
		location.href = '${cpath }/login.jsp';
	</script>
</c:if>

</body>
</html>