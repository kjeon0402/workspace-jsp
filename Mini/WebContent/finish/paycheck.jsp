<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypage-header.jsp" %>

<jsp:useBean id="input" class="order.OrderDTO" />
<jsp:setProperty property="*" name="input"/>
	<c:if test="${param.bigmac != 0 }">	
		<c:set var="row" value="${orderDAO.orderMenu(input) }" />	
	</c:if>
	
	<c:if test="${param.wopper != 0 }">	
		<c:set var="row" value="${orderDAO.orderMenu(input) }" />	
	</c:if>
	
	<c:if test="${param.shushu != 0 }">	
		<c:set var="row" value="${orderDAO.orderMenu(input) }" />	
	</c:if>
	
	<c:if test="${param.softcorn != 0 }">	
		<c:set var="row" value="${orderDAO.orderMenu(input) }" />	
	</c:if>
	
	<c:if test="${param.potato != 0 }">	
		<c:set var="row" value="${orderDAO.orderMenu(input) }" />	
	</c:if>
	
	<c:if test="${param.twistpotato != 0 }">	
		<c:set var="row" value="${orderDAO.orderMenu(input) }" />	
	</c:if>
	
	<c:if test="${param.coke != 0 }">	
		<c:set var="row" value="${orderDAO.orderMenu(input) }" />	
	</c:if>

<c:if test="${row != 0 }">
	<script>
		alert('주문 페이지로 이동합니다.');
		location.href = '${cpath }/finish/pay.jsp';
	</script>
</c:if>

</body>
</html>