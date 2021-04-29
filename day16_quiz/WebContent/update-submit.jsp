<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="inputData" class="day16_quiz.MemberDTO" />
<jsp:setProperty property="*" name="inputData" />

<c:set var="row" value="${dao.updateMember(inputData) }" />

<c:if test="${row != 0 }">
	<script>
		alert('성공적으로 정보를 수정했습니다.');
		location.href = '${cpath }';
	</script>
</c:if>

<c:if test="${row == 0 }">
	<script>
		alert('잘못된 접근입니다.');
		location.href = '${cpath }/update.jsp';
	</script>
</c:if>

</body>
</html>