<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="dao" class="day14.MemberDAO" />
<c:set var="list" value="${dao.selectList() }" />
<table>
	<tr>
		<th>ID</th>
		<th>PASSWORD</th>
		<th>NAME</th>
		<th>AGE</th>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.id }</td>
		<td>${dto.pw }</td>
		<td>${dto.name }</td>
		<td>${dto.age }</td>
	</tr>
	</c:forEach>
</table>

<fieldset>
	<legend>DAO를 이용하여 페이지 구성하기</legend>
	<ul>
		<li>회원가입 페이지</li>
		<li>로그인 페이지</li>
		<li>로그인 상태 확인</li>
		<li>개인정보 확인</li>
		<li>회원 탈퇴</li>
		<li>회원 정보 수정</li>
	</ul>
</fieldset>

</body>
</html>