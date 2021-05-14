<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="MainMenu.jsp" %>

<jsp:useBean id="input" class="order.OrderDTO" />
<jsp:setProperty property="*" name="input"/>
<c:set target="${input }" property="orderer" value="${login.name }" />
<c:set target="${input }" property="address" value="${login.address }" />
<c:if test="${param.cnt != 0 }">
	<c:set var="row" value="${orderDAO.orderMenu(input) }" />
</c:if>
<c:redirect url="MainMenu.jsp" />	

</body>
</html>