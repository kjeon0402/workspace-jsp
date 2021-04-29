<%@page import="day16.ProtoType"%>
<%@page import="day16.SingletonTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>ex02.jsp - 싱글톤이 뭔가요</h1>
<hr>

<%
	SingletonTest st1 = SingletonTest.getInstance();
	SingletonTest st2 = SingletonTest.getInstance();
	ProtoType pt1 = new ProtoType();
	ProtoType pt2 = new ProtoType();
	ProtoType pt3 = new ProtoType();
%>
<c:set var="st3" value="<%=SingletonTest.getInstance() %>" />

<h3><%=st1 %></h3>
<h3><%=st2 %></h3>
<h3>${st3 }</h3>
<h3><%=pt1 %></h3>
<h3><%=pt2 %></h3>
<h3><%=pt3 %></h3>

</body>
</html>