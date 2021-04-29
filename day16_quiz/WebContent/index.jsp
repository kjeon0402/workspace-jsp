<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%--
	기존 member 테이블을 제거하고
	새로 구성하세요
	
	idx 		number 			primary key, sequence
	userid		varchar2(20)	not null
	userpw 		varchar2(500)	not null
	username	varchar2(50)	not null
	age			number			check between 0 and 100
	gender		varchar2(10)	check gender in ('남성', '여성')
	registDate	date			default sysdate
	
	싱글톤 + 커넥션 풀 형태의 DAO를 구성하고, 회원에 관련된 CRUD를 구현한 페이지를 작성하세요
	java.util.Date
 --%>

<main>
	<p>MEMBER LIST</p>
	<table>
		<tr>
			<th>INDEX</th>		
			<th>ID</th>		
			<th>PASSWORD</th>		
			<th>NAME</th>		
			<th>AGE</th>		
			<th>GENDER</th>		
			<th>REGISTDATE</th>		
		</tr>
		<c:forEach var="dto" items="${dao.listMember() }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.userid }</td>
			<td>${dto.userpw }</td>
			<td>${dto.username }</td>
			<td>${dto.age }</td>
			<td>${dto.gender }</td>
			<td>${dto.registDate }</td>
		</tr>
		</c:forEach>
	</table>

</main>

</body>
</html>