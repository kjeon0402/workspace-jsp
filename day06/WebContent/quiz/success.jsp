<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- success.jsp - 계정의 모든 속성 정보를 출력하세요 (session 객체에서 값 꺼내서 출력하기) --%>

<ul>
	<li><strong>ID</strong> : ${login.id }</li>
	<li><strong>PW</strong> : ${login.pw }</li>
	<li><strong>NAME</strong> : ${login.name }</li>
	<li><strong>AGE</strong> : ${login.age }</li>
</ul>
<a href="${pageContext.request.contextPath }/quiz">처음으로</a>

</body>
</html>