<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="inputData" class="day15.MemberDTO" />
<jsp:setProperty property="*" name="inputData" />
<%-- 사용자 입력 데이터를 객체로 받는다 --%>

<jsp:useBean id="dao" class="day15.MemberDAO" />
<c:set var="login" value="${dao.getLoginMember(inputData) }" scope="session" />
<%-- 입력받은 데이터로 로그인을 시도하고 결과를 세션에 저장한다 --%>

<c:if test="${not empty login }">
	<c:redirect url="/" />
</c:if>
<%-- 로그인 성공이면 곧바로 대문 페이지로 이동한다(redirect) --%>

<c:if test="${empty login }">
	<h2>로그인 실패</h2>
	<a href="${cpath }/login.jsp"><button>로그인 페이지로</button></a>
</c:if>
<%-- 로그인 실패이면 메시지를 출력하고 다시 로그인할 수 있도록 링크를 제공한다 --%>

</body>
</html>