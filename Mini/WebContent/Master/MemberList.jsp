<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Master/MasterMain.jsp" %>

<main>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원이름</th>
			<th>회원아이디</th>
			<th>회원비밀번호</th>
			<th>주소</th>
			<th>카드 번호</th>
			<th>카드 비밀번호</th>
		</tr>
		
		<c:forEach var="dto" items="${guestDAO.guestList() }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.name }</td>
			<td>${dto.id }</td>
			<td>${dto.pw }</td>
			<td>${dto.address }</td>
			<td>${dto.card }</td>
			<td>${dto.cardpw }</td>
			<td><a href="${cpath }/Master/memberDrop.jsp?idx=${dto.idx}"><button>탈퇴</button></a></td>
		</tr>
		</c:forEach>
	</table>
</main>


</body>
</html>