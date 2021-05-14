<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypage-header.jsp" %>

<main>
	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<p>
				<input type="hidden" name="card" value="${login.card }">
				<strong>카드 번호 : </strong>${login.card }
			</p>
			<p><input type="password" name="cardpw" placeholder="CARD PASSWORD"></p>
			<p><input type="submit" value="결제"></p>
		</form>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<c:if test="${param.cardpw == login.cardpw }">
			
			<c:set var="row" value="${orderDAO.payYes(param.orderer) }" />
			<c:if test="${row != 0 }">
				<script>
					alert('결제가 완료되었습니다. 주문 내역으로 이동합니다.');
					location.href = '${cpath }/order-list.jsp';
				</script>
			</c:if>
		</c:if>
		
		<c:if test="${param.cardpw != login.cardpw }">
			<script>
				alert('정보가 일치하지 않습니다.');
				location.href = '${cpath }/finish/pay.jsp';
			</script>
		</c:if>
	</c:if>
</main>

</body>
</html>