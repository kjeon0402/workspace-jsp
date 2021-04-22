<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="userJoin" class="day14.MemberDTO" />
<jsp:setProperty property="*" name="userJoin" />
<jsp:useBean id="dao" class="day14.MemberDAO" />
<c:set var="row" value="${dao.getJoinMember(userJoin) }" />

<c:if test="${row != 0 }">
	<c:redirect url="/" />
</c:if>

<c:if test="${row == 0 }">
	<script>
		alert("회원 가입 실패");
		location.href = '${cpath }';
	</script>
</c:if>

</body>
</html>