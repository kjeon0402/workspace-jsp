<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="inputData" class="day15.MemberDTO" />
<jsp:setProperty property="*" name="inputData" />

<jsp:useBean id="dao" class="day15.MemberDAO" />
<c:set var="row" value="${dao.getDropMember(inputData) }" />

<c:if test="${row != 0 }">
	<%-- 탈퇴처리 되었으면 세션에 있는 login 객체를 제거하고, 대문 페이지로 이동 --%>
<%-- 	<% session.invalidate(); %> --%>
	<c:remove var="login" scope="session" />
	<c:redirect url="/" />
</c:if>

<c:if test="${row == 0 }">
	<%-- 정보가 일치하지 않습니다 라고 출력하고, 탈퇴 페이지로 이동 --%>
	<script>
		alert('정보가 일치하지 않습니다.')
		location.href="${cpath }/drop.jsp";
	</script>
</c:if>

</body>
</html>