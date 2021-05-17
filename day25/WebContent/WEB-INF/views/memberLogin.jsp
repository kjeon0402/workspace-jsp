<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberLogin</title>
</head>
<body>

<%-- <c:if test="${not empty login }"> --%>
<!-- 	<script> -->
<!-- // 		alert('로그인을 성공하셨습니다.'); -->
<%-- // 		location.href = '${cpath }/member'; --%>
<!-- 	</script> -->
<%-- </c:if> --%>

<%-- <c:if test="${empty login }"> --%>
<!-- 	<script> -->
<!-- // 		alert('로그인을 실패하셨습니다.'); -->
<%-- // 		location.href = '${cpath }/member'; --%>
<!-- 	</script> -->
<%-- </c:if> --%>

<script>
	const flag = ${not empty login};	// const flag = true;
										// const flag = false;
	if(flag) {
		alert('id : ${login.id}, name : ${login.name}');
	} else {
		alert('로그인 실패');
	}
	
	location.href = "${cpath }/member";
</script>

</body>
</html>