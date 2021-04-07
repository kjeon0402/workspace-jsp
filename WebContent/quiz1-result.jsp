<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz-result.jsp</title>
</head>
<body>

<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String adult = Integer.parseInt(age) >= 20 ? "성인" : "미성년자";
// 	int inAge = Integer.parseInt(age);
// 	boolean adult;
	
// 	if(inAge >= 20) {
// 		adult = true;
// 	} else {
// 		adult = false;
// 	}
	
	String remoteAddr = request.getRemoteAddr();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일, hh시 mm분 ss초");
	String today = sdf.format(new Date());
%>
<h1>quiz1 - 결과페이지</h1>
<hr>
<ul>
	<li><strong>이름</strong> : <%=name %></li>
	<li><strong>나이</strong> : <%=age %></li>
	<li><strong>성인 여부</strong> : <%=adult %></li>
	
	<li><strong>요청자의 IP</strong> : <%=remoteAddr %></li>
	<li><strong>요청받은 시점의 현재 시간</strong> : <%=today %></li>
</ul>
<a href="quiz1.jsp"><button>이전 페이지로</button></a>

</body>
</html>