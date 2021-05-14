<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypage-header.jsp" %>

<main>
	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<p><input type="hidden" name="idx" value="${login.idx }"></p>
			<p><input type="password" name="pw" placeholder="PASSWORD"></p>
			<p><input type="text" name="card" placeholder="CARD NUM : oooo-oooo-oooo"></p>
			<p><input type="password" name="cardpw" placeholder="CARD PASSWORD"></p>
			<p><input type="submit" value="수정 완료"></p>
		</form>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="inputData" class="guest.GuestDTO" />
		<jsp:setProperty property="*" name="inputData"/>
		<c:set var="row" value="${guestDAO.changePw(inputData) }" />
		
		<c:if test="${row == 1 }">
			<c:remove var="login" scope="session" />
			<script>
				alert('정보를 수정하셨습니다. 다시 로그인해주세요');
				location.href = '${cpath }/member/login.jsp';
			</script>
		</c:if>
		
		<c:if test="${row != 1 }">
			<script>
				alert('잘못된 접근입니다.');
				location.href = '${cpath }/changepw-result.jsp';
			</script>
		</c:if>
	</c:if>
</main>

</body>
</html>