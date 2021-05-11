<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h2>글 읽기</h2>
<c:set var="row" value="${dao.viewUp(param.idx) }" />
<c:set var="dto" value="${dao.selectOne(param.idx) }" />

<div>
	<div class="sb">
		<div>
			<span>${dto.idx }</span> |
			<span>${dto.title }</span> |
			<span>${dto.writer }</span>		
		</div>
		<div>
			<span>${dto.writeDate }</span> |
			<span>조회수 : ${dto.viewCount }</span> |
			<span>${dto.ipaddr }</span>
		</div>
	</div>
	<div class="content">
		<div class="content-img" style="background-image: url('${cpath}/uploadPath/${dto.uploadFile }');"></div>
		<pre>${dto.content }</pre>
	</div>
	<div class="sb">
		<div>
			<a href="${cpath }/board/list.jsp?page=${param.page }&type=${param.type }&word=${param.word }"><button>목록</button></a>
		</div>
		<div>
			<c:if test="${login.name == dto.writer }">
				<a href="${cpath }/board/modify.jsp?idx=${dto.idx }"><button>수정</button></a>
				<button id="deleteBtn">삭제</button>
			</c:if>
		</div>
	</div>	
</div>

<div class="reply">
	<c:set var="comment" value="${empty login ? '로그인한 사용자만 댓글을 작성할 수 있습니다.' : '바르고 고운 말을 사용합시다'}" />
	
	<div class="reply-form">
		<form method="POST">
			<%-- 글번호, 작성자, 내용 --%>
			<p><input type="hidden" name="bnum" value="${dto.idx }"></p>
			<p><input type="text" name="writer" value="${login.name }" readonly required></p>
			<p><textarea name="content" placeholder="${comment } ${empty login ? 'disabled': '' }" required></textarea></p>
			<p><input type="submit" value="댓글 작성"></p>
		</form>
	</div>
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="reply" class="board.ReplyDTO" />
		<jsp:setProperty property="*" name="reply"/>
		<c:set var="row" value="${dao.insertReply(reply) }" />
		<c:redirect url="/board/read.jsp?idx=${param.idx }&page=${param.page }&type=${param.type }&word=${param.word }" />
	</c:if>
	
	<div class="reply-list">
		<c:forEach var="dto" items="${dao.showReply(param.idx) }">
			<fieldset>
				<p>${dto.idx } | ${dto.bnum } | <strong>${dto.writer }</strong></p>
				<p>${dto.writeDate }</p>
				<p>${dto.content }</p>
				<a href="reply-mod.jsp"><button>수정</button></a>
				<a href="reply-del.jsp"><button>삭제</button></a>				
			</fieldset>
		</c:forEach>
	</div>
</div>

<script type="text/javascript">
	const deleteBtn = document.getElementById('deleteBtn');
	deleteBtn.onclick = function() {
		const answer = confirm('${dto.idx }번 게시글을 정말 삭제하시겠습니까?');
		if(answer) {
			location.replace('${cpath }/board/delete.jsp?idx=${dto.idx }');
		}
	}
</script>
</body>
</html>