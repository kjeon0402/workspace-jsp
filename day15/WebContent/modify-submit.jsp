<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="inputData" class="day15.MemberDTO" />
<jsp:setProperty property="*" name="inputData" />

<jsp:useBean id="dao" class="day15.MemberDAO" />
<c:set var="row" value="${dao.getUpdateMember(inputData) }" />

<c:if test="${row != 0 }">
	<%-- 수정 성공 --%>
	<c:remove var="login" scope="session" />
	<script>
		alert('정보가 수정되었습니다. 다시 로그인해주세요.');
		location.href = "${cpath }/login.jsp";
	</script>
</c:if>

<c:if test="${row == 0 }">
	<%-- 수정 실패 : id가 조건에 맞지 않아서 수정된 레코드가 0줄인 상황 --%>
	<script>
		alert('잘못된 접근입니다.');
		location.href = "${cpath }/modify.jsp";
	</script>
</c:if>

</body>
</html>