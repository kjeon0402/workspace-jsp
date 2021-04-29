<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h2>게시판</h2>
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
			<c:forEach var="boardDTO" items="${dao.selectList() }">
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
				<option value="title">제목으로 검색</option>
				<option value="writer">작성자로 검색</option>
				<option value="content">내용으로 검색</option>
			</select>
			<input type="search" name="word">
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