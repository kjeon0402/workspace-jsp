<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<main>
	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<h2>관리자 로그인</h2>
			<p><input type="text" name="id" placeholder="ID"></p>
			<p><input type="password" name="pw" placeholder="PASSWORD"></p> 
			<p><input type="password" name="mk"placeholder="MasterKey"></p>
			<p><input type="submit" value="로그인"></p>
		</form>
	</c:if>
	
		<c:if test="${pageContext.request.method == 'POST'}">

		<script>
			const flag = '${param.id}' == '12345'  && '${param.pw}' == 'qwert' && '${param.mk}' == 'qwer1234';
			if(flag) {
				location.href = '../Master/MasterMain.jsp';
			} else {
				alert('정보가 일치하지 않습니다.');
				history.go(-1);
			}
		</script>
	</c:if>
</main>

</body>
</html>