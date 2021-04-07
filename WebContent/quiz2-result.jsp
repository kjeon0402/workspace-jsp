<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz2-result.jsp</title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String birth = String.format("%s년 %s월 %s일", year, month, date);
	
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String phoneNumber = request.getParameter("phoneNumber");
%>

<h1>quiz2 - 결과 페이지</h1>
<hr>
<fieldset>
<ul>
	<li><strong>ID</strong> : <%=id %></li>
	<li><strong>PW</strong> : <%=password %></li>
	<li><strong>이름</strong> : <%=name %></li>
	<li><strong>생년월일</strong> : <%=birth %></li>
	<li><strong>성별</strong> : <%=gender %></li>
	<li><strong>이메일</strong> : <%=email %></li>
	<li><strong>전화번호</strong> : <%=phoneNumber %></li>
</ul>
</fieldset>
<a href="quiz2.jsp"><button>이전 페이지로</button></a>

</body>
</html>