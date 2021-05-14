<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypage-header.jsp" %>

<c:set var="row" value="${orderDAO.deleteOrder(param.idx) }" />
<c:if test="${row != 0 }">
	<script>
		alert('장바구니 내역을 삭제합니다.');
		location.href = '${cpath }/shopping-basket.jsp';
	</script>
</c:if>

</body>
</html>