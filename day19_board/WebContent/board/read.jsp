<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h2>글 읽기</h2>
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
			<a href="${cpath }/board/list.jsp"><button>목록</button></a>
		</div>
		<div>
			<a href=""><button>수정</button></a>
			<a href=""><button>삭제</button></a>
		</div>
	</div>	
</div>
</body>
</html>