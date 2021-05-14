<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Master/MasterMain.jsp" %>

<main>
	<table>
		<tr>
			<th>메뉴번호</th>
			<th>종류</th>
			<th>이미지</th>
			<th>메뉴이름</th>
			<th>가격</th>
		</tr>
		
		<c:forEach var="dto" items="${menuDAO.allList() }">
		<tr>
			<td>${dto.IDX }</td>
			<td>${dto.KIND }</td>
			<td><img src="${cpath }/baseimage/${dto.IMG }" width="100px"></td>
			<td>${dto.NAME }</td>
			<td>${dto.PRICE }</td>
		</tr>
		</c:forEach>
	</table>
</main>

</body>
</html>