<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	private int num;
%>
<%
	int num2 = 0;

	System.out.println("num : " + ++num);
	System.out.println("num2 : " + ++num2);
%>


</body>
</html>