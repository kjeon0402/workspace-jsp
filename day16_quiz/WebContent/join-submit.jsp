<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="inputData" class="day16_quiz.MemberDTO" />
<jsp:setProperty property="*" name="inputData" />

<c:set var="row" value="${dao.joinMember(inputData, param.date) }" />

<c:if test="${row != 0 }">
	<script>
		alert('회원가입에 성공했습니다.');
		location.href = '${cpath }/index.jsp';
	</script>
</c:if>

<c:if test="${row == 0 }">
	<script>
		alert('회원가입에 실패했습니다.');
		location.href = '${cpath }/join.jsp';
	</script>
</c:if>

</body>
</html>