<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypage-header.jsp" %>
<main>
	<form method="POST">
		<p><input type="password" name="pw" placeholder="비밀번호 다시 입력"></p>
		<p><input type="submit" value="탈퇴하기"></p>
		
	</form>
	<c:if test="${pageContext.request.method=='POST' }">
	<c:set var="idx" value="${login.idx }"/>
	<c:set var="row" value="${guestDAO.drop(idx,param.pw) }" />
	
	<c:if test="${row == 1 }">
		<script>
			alert('탈퇴 완료');
			location.href = '${cpath }';
		</script>
		<c:remove var="login" scope="session" />
	</c:if>
		<c:if test="${row == 0 }">
		<script>
			alert('비밀번호가 다릅니다. 다시 부탁드려요');
			location.href = '${cpath }/member/drop.jsp';
		</script>
	</c:if>
	
	</c:if>
</main>
</body>
</html>