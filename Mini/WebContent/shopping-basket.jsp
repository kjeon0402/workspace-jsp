<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypage-header.jsp" %>

<main>
	<table>
		<tr>
			<th>주문 번호</th>
			<th>주문 상품명</th>
			<th>주문 수량</th>
			<th>총 금액</th>
			<th>주문자 이름</th>
			<th>주문자 주소</th>
			<th>주문 시간</th>
			<th></th>
		</tr>
		<c:set var="orderer" value="${login.name }" />
		<c:forEach var="dto" items="${orderDAO.shoppingBasket(orderer) }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.product }</td>
			<td>${dto.cnt }</td>
			<td>${dto.total }</td>
			<td>${dto.orderer }</td>
			<td>${dto.address }</td>
			<td>${dto.ordertime }</td>
			<td><a href="${cpath }/delete-order.jsp?idx=${dto.idx }"><button>-</button></a></td>
		</tr>
		</c:forEach>
		
	</table>
	<td><a href="${cpath }/finish/pay.jsp?orderer=${login.name }"><button>결제</button></a></td>
	
<%-- <h2>${idxList }</h2> --%>
<%-- ?<c:forEach var="idx" items="${idxList }" varStatus="st">idx=${idx }<c:if test="${not st.last }">&</c:if></c:forEach>	 --%>
</main>

</body>
</html>