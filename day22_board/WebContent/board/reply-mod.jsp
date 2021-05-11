<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${login.name != param.name }">
	<script>
		alert('본인이 작성한 댓글만 수정할 수 있습니다.');
		location.href = '/board/read.jsp?idx=${param.idx }&page=${param.page }&type=${param.type }&word=${param.word }';
	</script>
</c:if>

<c:if test="${login.name == param.name }">
	
</c:if>

</body>
</html>