<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST">
	<p><input type="text" name="id" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="PASSWORD"></p>
	<p><input type="submit" value="LOGIN"></p>
</form>

<c:if test="${not empty param.id and not empty param.pw }">
	<jsp:useBean id="dao" class="day14.MemberDAO" />
	<jsp:setProperty property="*" name="dao" />
	<c:set var="dto" value="${dao.getLoginMember(param.id, param.pw) }" />
	<fieldset>
		<legend>로그인 결과</legend>
		<c:if test="${empty dto }">
			<p>로그인 실패</p>
		</c:if>
		<c:if test="${not empty dto }">
			<p>로그인 성공, ${dto.name }(${dto.id })님, 환영합니다.</p>
		</c:if>
	</fieldset>
</c:if>

</body>
</html>