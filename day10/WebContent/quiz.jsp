<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="day10.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 
		로그인 메뉴를 구현하세요
		로그인 폼에는 id, pw, id저장, 로그인 상태 유지 옵션이 있어야 합니다
		로그인 정보는 자바빈즈 클래스로 처리합니다
		계정 클래스는 id, pw, name 속성을 포함합니다
		쿠키, 세션, 리다이렉트 등의 기술을 사용합니다
		스크립틀릿 혹은 JSTL로 처리할 수 있습니다
		간단한 로고를 만들고, 로고를 클릭하면 로그인 폼으로 이동할 수 있어야 합니다
		이미 로그인 되어 있으면 결과 페이지로 이동시켜야 하고
		로그인 안된 상태에서는 결과 페이지에서 로그인폼으로 이동시켜야 합니다
 --%>
 
<c:if test="${not empty login }">
	<c:redirect url="quiz-result.jsp" />
</c:if>
 
<h1><a style="text-decoration: none; color: chocolate;" href="${cpath }/quiz.jsp">LOGIN</a></h1>
<hr>
<main>
	<form method="POST" action="login-submit.jsp">
		<p><input type="text" name="id" placeholder="ID" value="${cookie.id.value }" required autofocus autocomplete="off"></p>
		<p><input type="password" name="pw" placeholder="Password"></p>
		<label>
			<p>
				<input type="checkbox" name="storeid" ${not empty cookie.id ? 'checked' : '' }>ID저장
				<input type="checkbox" name="keepSession">로그인 유지
			</p>
		</label>
		<p><input type="submit" value="로그인"></p>
	</form>
</main>

</body>
</html>