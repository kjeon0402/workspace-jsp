<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="day06.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp - c:forEach</title>
</head>
<body>
<%
	Member[] arr = {
		new Member("이지은", 29),	
		new Member("강지언", 27),	
		new Member("임수지", 27),	
		new Member("김태희", 29),	
		new Member("김은정", 27),	
	};

	ArrayList<Member> list = new ArrayList<Member>(Arrays.asList(arr));
	
	pageContext.setAttribute("arr", arr);
	pageContext.setAttribute("list", list);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>c:forEach</h1>
<hr>
<%--
	for(Member member : arr) {
		out.print("<li>" + member.getName() + " : " + member.getAge() + "</li>");
	}
 --%>

<h3>배열의 요소를 화면에 반복문으로 출력하기</h3>
<ul>
	<c:forEach var="member" items="${arr }">
		<li>${member.name } : ${member.age }</li>
	</c:forEach>
</ul>

<h3>리스트의 요소를 화면에 반복문으로 출력하기</h3>

<table border="1" cellpadding="10" cellsapcing="0">
	<thead>
		<tr>
			<th>st.index</th>
			<th>st.count</th>
			<th>st.first</th>
			<th>st.last</th>
			<th>이름</th>
			<th>나이</th>
			<th>성인여부</th>
		</tr>
	</thead>
	<tbody>
<%-- 		<tr><th>${list }</th></tr> --%>
		<c:forEach var="member" items="${list }" varStatus="st">
		<tr style="background-color: ${st.index % 2 == 0 ? 'skyblue' : 'salmon' };
					color: ${st.last ? 'yellow' : 'inherit' };">
			<td>${st.index }</td>
			<td>${st.count }</td>
			<td>${st.first }</td>
			<td>${st.last }</td>
			<td>${member.name }</td>
			<td>${member.age }</td>
			<td>${member.age >= 20 ? '성인' : '미성년자' }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<div>
<p>
<c:forEach var="m" items="${list }" varStatus="st">
	${m.name }
	<c:if test="${st.last == false }">
	,
	</c:if>
	<c:if test="${st.last == true }">
		</p>
	</c:if>
</c:forEach>
</div>

<h3>횟수에 의한 반복</h3>

<ul>
	<c:forEach var="i" begin="1" end="10" step="1">
<!-- 		<li> -->
<%-- 			<c:if test="${i % 2 == 0 }"> --%>
<%-- 				<li style="color: red;">${i } : 짝수</li> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${i % 2 != 0 }"> --%>
<%-- 				<li style="color: blue;">${i } : 홀수</li> --%>
<%-- 			</c:if> --%>
<!-- 		</li> -->
		<li style="color: ${i % 2 == 0 ? 'red' : 'blue'}">
			${i } : ${i % 2 == 0 ? '짝수' : '홀수' }
		</li>
	</c:forEach>
</ul>
<%--
	for(int i = 0; i <= 5; i++) {
		out.print("<li>" + i + "</li>")
	}
 --%>

</body>
</html>