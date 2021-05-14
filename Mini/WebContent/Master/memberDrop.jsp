<%@page import="guest.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="guestDAO" value="<%=GuestDAO.getInstance() %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="row" value="${guestDAO.masterdrop(param.idx) }" />
	<c:remove var="login" scope="session" />
	<script>
		alert('삭제를 진행합니다.');
		location.href = '${cpath}/Master/MemberList.jsp';
	</script>



</body>
</html>