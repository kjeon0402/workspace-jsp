<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- failure.jsp - <script>alert('로그인 실패'); location.replace('index.jsp'); </script> --%>
<script>
	alert('로그인 실패');
	location.replace('index.jsp');
	// javascript에서 지정한 주소로 페이지를 이동하는 함수
	// 주소를 지정해서 이동하므로, GET방식(redirect와 비슷한 효과)
</script>

</body>
</html>