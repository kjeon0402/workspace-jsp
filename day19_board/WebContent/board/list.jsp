<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h2>게시판</h2>
<%-- 
	만약 파라미터 type과 word가 없으면, 전체 목록을 불러오고,
	아니면, type과 word를 전달하면서 DAO의 메서드를 호출하여 조건에 맞는 목록만 불러온다
 --%>
<c:if test="${empty param.type }">
	<c:set var="boardList" value="${dao.selectList() }" />
</c:if>

<c:if test="${not empty param.type }">
	<c:set var="boardList" value="${dao.selectList(param.type, param.word) }" />
</c:if>

<div class="board-list">
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty boardList }">
			<tr>
				<th colspan="5"><h2>검색 결과가 없습니다</h2></th>
			</tr>
		</c:if>
			<c:forEach var="boardDTO" items="${boardList }">
				<tr class="boardDTO">
					<td>${boardDTO.idx }</td>
					<td>
						<a href="${cpath }/board/read.jsp?idx=${boardDTO.idx }">${boardDTO.title }</a>
					</td>
					<td>${boardDTO.writer }</td>
					<td>${boardDTO.viewCount }</td>
					<td>${boardDTO.writeDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="down-menu sb">
	<div>
		<form>
			<select name="type">
				<option ${param.type == 'title' ? 'selected' : '' } value="title">제목으로 검색</option>
				<option ${param.type == 'writer' ? 'selected' : '' } value="writer">작성자로 검색</option>
				<option ${param.type == 'content' ? 'selected' : '' } value="content">내용으로 검색</option>
			</select>
			<input type="search" name="word" value="${param.word }" placeholder="검색어를 입력하세요">
			<input type="submit" value="검색">
		</form>
	</div>
	<div>
		<a href="${cpath }/board/write.jsp"><button>작성</button></a>
	</div>
</div>
<div class="paging-number"></div>
</body>
</html>