<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="inputData" class="day15_quiz.ManagerDTO" />
<jsp:setProperty property="*" name="inputData" />

<jsp:useBean id="dao" class="day15_quiz.ManagerDAO" />
<c:set var="login" value="${dao.loginManager(inputData) }" scope="session" />

<c:if test="${not empty login }">
	<c:redirect url="/" />
</c:if>

<c:if test="${empty login }">
	<h2>로그인 실패</h2>
	<a href="${cpath }/login.jsp"><button>로그인 페이지로</button></a>
</c:if>

</body>
</html>