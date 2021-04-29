<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date</title>
</head>
<body>

<form method="POST">
	<input type="date" name="date">
	<input type="submit" value="전송">
</form>

<c:if test="${pageContext.request.method == 'POST' }">
<%
	String dateStr = request.getParameter("date");
	Date date = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	date = sdf.parse(dateStr);
	System.out.println("dateStr : " + dateStr);
	System.out.println("date : " + date);
%>
<h2><%=date %></h2>
</c:if>

</body>
</html>