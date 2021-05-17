<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlet Test</title>
</head>
<body>

<h1>Servlet Test</h1>
<hr>
<h3>
	http://
	${pageContext.request.localAddr }:
	${pageContext.request.localPort }
	${pageContext.request.contextPath }
</h3>
<ul>
	<li><a href="${cpath }/hello">ex01 - HelloServlet</a></li>
	<li><a href="${cpath }/now">ex02 - NowServlet</a></li>
	<li><a href="${cpath }/life">ex03 - LifeCycleServlet</a></li>
	<li><a href="${cpath }/member">ex04 - MemberSevlet</a></li>
</ul>

</body>
</html>