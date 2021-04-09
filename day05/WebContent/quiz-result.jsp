<%@page import="day05.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz-result.jsp</title>
</head>
<body>
<h1>quiz-result.jsp</h1>
<hr>
<%
	// twice 객체가 없으면 돌아간다(quiz.jsp에서 다시 객체를 생성하고 setAttribute하고 온다)
	if(request.getAttribute("twice") == null) {
		response.sendRedirect("quiz.jsp");
		return;
	}
	// twice 배열 객체를 꺼내와서 
	// 스크립틀릿에서 for문을 사용하고
	// EL Tag를 이용하여
	// <ul> 태그 사이에 이름과 나이를 <li>태그로 출력하세요
	// index 대신 향상된 for문을 활용하여 작성을 시도해보세요
	
%>
<ul>
<%
	Member[] arr = (Member[])request.getAttribute("twice");
	for(Member m : arr) {
		pageContext.setAttribute("m", m);
		%>
			<li>${m.name }, ${m.age }살</li>
		<%
	}
%>
</ul>
<hr>
<ol>
<%
	for(int i = 0; i < arr.length; i++) {
		pageContext.setAttribute("i", i);
		%>
		<li>${twice[i].name }, ${twice[i].age }살</li>
		<%
	}
%>

</ol>

</body>
</html>