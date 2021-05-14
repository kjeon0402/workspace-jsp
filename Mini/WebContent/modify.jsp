<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypage-header.jsp" %>

<main>
<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input type="hidden" name="idx" value="${login.idx }"></p>
		<p>
			<input type="hidden" name="id" value="${login.id }">
			<strong>ID : </strong>${login.id }
		</p>		
		<p>
			<input type="hidden" name="pw" value="${login.pw }">
			<strong>비밀번호 : </strong>**************
		</p>		
		<p><strong>이름 : </strong><input type="text" name="name" value="${login.name }" placeholder="NAME"></p>		
		<p><strong>주소 : </strong><input type="text" name="address" value="${login.address }" placeholder="ADDRESS"></p>		
		<p>
			<input type="hidden" name="card" value="${login.card }">
			<strong>카드 번호 : </strong>****-****-****-****
		</p>		
		<p>
			<input type="hidden" name="cardpw" value="${login.cardpw }">
			<strong>카드 비밀번호 : </strong>**************
		</p>		
		<p class="mod-submit">
			<a href="${cpath }/member/changepw.jsp">개인 정보 수정</a>
			<input type="submit" value="수정">
		</p>		
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="inputData" class="guest.GuestDTO" />
	<jsp:setProperty property="*" name="inputData"/>
	<c:set var="row" value="${guestDAO.modify(inputData) }" />
	<script>
		const row = ${row};
		alert('정보 수정 ' + (row == 1 ? '성공' : '실패'));
		location.href = '${cpath}' + (row == 1 ? '/member/headerlogout.jsp' : '/modify.jsp');
	</script>
</c:if>
</main>

</body>
</html>