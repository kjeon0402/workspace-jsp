<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h2>글 쓰기</h2>

<c:if test="${empty login }">
	<script>	
		alert('로그인이 필요한 메뉴입니다.');
		location.href = '${cpath }/member/login.jsp';
	</script>
</c:if>

<c:if test="${not empty login }">
<main>
<div>
	<form method="POST" encType="multipart/form-data">
	<!-- hidden으로 넘겨주는 값 -->
	<input type="hidden" name="ipaddr" value="${pageContext.request.remoteAddr }">
	<div class="sb">
		<div>
			<p><input type="text" name="title" placeholder="제목을 입력하세요" required autofocus></p>	
			<p><input type="hidden" name="writer" placeholder="작성자 이름을 입력하세요" value="${login.name }"></p>	
			<p><strong>${login.name }</strong>(${login.id })</p>
		</div>
	</div>
	<div class="content">
		<textarea name="content" placeholder="여기에 내용을 입력하세요" required></textarea>
		<p><input type="file" name="uploadFile"></p>
	</div>
	<div class="sb">
		<div>
			<a href="${cpath }/board/list.jsp"><input type="button" value="작성취소"></a>
		</div>
		<div>
			<button>등록</button>
		</div>
	</div>	
	</form>
</div>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="fileUtil" class="board.FileUtil" />
	<c:set var="dto" value="${fileUtil.getBoardDTO(pageContext.request) }" />
	<c:set var="row" value="${dao.insert(dto) }" />
	<script>
		const row = ${row};
		alert(row == 1 ? '작성을 성공했습니다.' : '작성을 실패했습니다.');
		location.href = '${cpath}/board/list.jsp?page=1';
	</script>
</c:if>
</main>
</c:if>

</body>
</html>