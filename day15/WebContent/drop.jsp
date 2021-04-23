<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%--
	로그인된 사용자가 탈퇴를 요청하면,
	비밀번호를 한 번 더 입력 받고 
	일치하면 탈퇴처리 후
	세션을 만료시키고
	대문 페이지로 이동
 --%>
 
<c:if test="${empty login }">
	<script>
		alert('로그인이 필요한 메뉴입니다.');
		location.href = '${cpath }/login.jsp';
	</script>
</c:if>

<c:if test="${not empty login }">
	<h2>회원 탈퇴</h2>
	<form method="POST" action="drop-submit.jsp">
		<input type="hidden" name="id" value="${login.id }">
		<input type="password" name="pw" placeholder="비밀번호를 입력하세요">
		<input type="submit" value="탈퇴 신청">
	</form>
</c:if>

</body>
</html>