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
		</tr>
		<c:set var="orderer" value="${login.name }" />
		<c:forEach var="dto" items="${orderDAO.listOrder(orderer) }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.product }</td>
			<td>${dto.cnt }</td>
			<td>${dto.total }</td>
			<td>${dto.orderer }</td>
			<td>${dto.address }</td>
			<td>${dto.ordertime }</td>
		</tr>
		</c:forEach>
	</table>
</main>

</body>
</html>