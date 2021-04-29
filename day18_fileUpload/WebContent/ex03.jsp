<%@page import="day18_fileUpload.ImageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
<style>
	.box {
		border: 2px solid black;
		padding: 5px;
		margin: 5px;
	}
	.wrap {
		display: flex;
		flex-flow: wrap;
		width: 100%;
	}
	.box > div:nth-child(1) {
		background-size: 200px;
		background-position: center center;
		background-repeat: no-repeat;
		width: 200px;
		height: 200px;
	}
</style>
</head>
<body>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST" enctype="multipart/form-data">
		<p><input type="file" name="uploadFile" required></p>
		<p><input type="submit" value="등록"></p>
	</form>
	<c:set var="cpath" value="${pageContext.request.contextPath }" />
	
	<div class="wrap">
		<c:set var="dao" value="<%=ImageDAO.getInstance() %>" />
		<c:set var="list" value="${dao.selectList() }" />
		<c:forEach var="img" items="${list }">
			<div class="box">
				<div style="background-image: url('${cpath}/uploadPath/${img.storedFileName }');"></div>
				<div><h4>${img.originalFileName }</h4></div>
			</div>
		</c:forEach>
	</div>
</c:if>
<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="fileUpload" class="day18_fileUpload.FileUpload" />
	<c:set var="dto" value="${fileUpload.getImageDTO(pageContext.request) }" />
	<c:set var="dao" value="<%=ImageDAO.getInstance() %>" />
	<c:set var="row" value="${dao.insert(dto) }" />
	<script>
		const row = ${row};
		alert(row == 1 ? '업로드 성공' : '실패');
		location.href = 'ex03.jsp';
	</script>
</c:if>

</body>
</html>