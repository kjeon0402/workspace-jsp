<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="day06.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
<%--
	login.jsp - Account.java 클래스를 이용하여 파라미터를 받으세요. 로그인 여부에 따라 success.jsp / failure.jsp로 이동시키세요(redirect)
				로그인 성공시, 계정 정보를 담은 객체를 session에 setAttribute하세요
				필요한 계정 정보를 List<Account> 형식으로 만들어서, application 객체에 넣으두세요
 --%>
 
<%
	Account[] arr = new Account[] {
		new Account("suzy", "960205", "임수지", 27),
		new Account("jieon", "950402", "강지언", 27),
		new Account("taehee", "292929", "김태희", 29),
		new Account("eunjeong", "960201", "김은정", 27),
		new Account("taeyeon", "890309", "김태연", 32)
	};

	List<Account> list = Arrays.asList(arr);
	application.setAttribute("list", list);
%>
<jsp:useBean id="logIn" class="day06.Account" />	<%-- 사용자 입력값을 처리하기 위한 빈 객체 --%>
<jsp:setProperty property="*" name="logIn"/>		<%-- 이름이 일치하는 값을 모두 세팅한다 --%>

<%
// 	for(Account acc : arr) {
// 		if(logIn.equals(acc)) {
// 			session.setAttribute("acc", acc);
// 			response.sendRedirect("success.jsp");
// 			return;
// 		}
// 	}
// 	response.sendRedirect("failure.jsp");
%>

<c:forEach var="account" items="${list }">
	<c:if test="${account.id == logIn.id and account.pw == logIn.pw }">
		<c:set var="login" value="${account }" scope="session" />
		<c:redirect url="success.jsp" />
	</c:if>
</c:forEach>

<%-- 반복문으로 등록된 모든 계정과 일치여부를 비교했는데 success.jsp로 이동하지 않았으니 실패한 상태이다 --%>
<c:redirect url="failure.jsp" />

</body>
</html>