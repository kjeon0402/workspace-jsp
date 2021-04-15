<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="day09.*, java.util.ArrayList, java.util.Arrays"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	if(application.getAttribute("list") == null) {
		Book[] arr = new Book[] { 
			new Book("수학의 정석", "홍성대", "성지출판(주)", "1966-01-01", 5000),
			new Book("달러구트 꿈 백화점", "이미예", "팩토리나인", "2020-07-08", 500),
			new Book("공정하다는 착각", "마이클 샌댈", "와이즈베리", "2020-12-01", 1000),
			new Book("주린이도 술술 읽는 친절한 주식책", "최정희, 이슬기", "메이트북스", "2020-09-01", 345),
			new Book("스토리텔링 바이블", "대니얼 조슈아 루빈", "블랙피쉬", "2020-12-06", 500),
			new Book("어떻게 말해줘야 할까", "오은영", "김영사", "2020-10-08", 700),
			new Book("마음챙김의 시", "류시화", "수오서재", "2020-09-15", 123) 
		};
		ArrayList<Book> list = new ArrayList<Book>(Arrays.asList(arr));
		application.setAttribute("list", list);
	}
	if(application.getAttribute("memberList") == null) {
		System.out.println("회원의 데이터를 생성하여 등록합니다");
		Account[] arr2 = new Account[] {
			new Account("suzy", "0215", "임수지", "suzy@naver.com"),	
			new Account("taehee", "2929", "김태희", "taehee@naver.com"),	
			new Account("eunjeong", "0201", "김은정", "eunjeong@naver.com"),	
			new Account("jieon", "0402", "강지언", "jieon@naver.com"),	
		};
		ArrayList<Account> memberList = new ArrayList<Account>(Arrays.asList(arr2));
		application.setAttribute("memberList", memberList);
	}
%>
<%
	String theme = request.getParameter("theme");

	if(theme != null) {
		Cookie c = new Cookie("theme", theme);
		c.setMaxAge(86400 * 7);
		response.addCookie(c);
		response.sendRedirect("index.jsp");
	}
	
	Cookie[] arr = request.getCookies();
	if(arr != null) {
		for(Cookie coo : arr) {
			if(coo.getName().equals("theme")) {
				pageContext.setAttribute("themeCookie", coo.getValue());
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day09 - 연습</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body class=${themeCookie }>
<header>
	<h1><a href="${pageContext.request.contextPath }/quiz">도서 관리 프로그램</a></h1>
	<div class="login-info">
		<c:if test="${not empty sessionScope.login }">
			<strong>${login.name }</strong> (${login.id })&nbsp;
		</c:if>
		<select name="theme">
			<option ${themeCookie == 'basic' ? 'selected' : ' ' }>Basic</option>
			<option ${themeCookie == 'dark' ? 'selected' : ' ' }>Dark</option>
		</select>
		<input type="submit" value="테마 적용">
	</div>
	
	<nav>
		<ul>
			<li><a href="${not empty login ? 'logout' : 'login' }.jsp">${not empty login ? '로그아웃' : '로그인' }</a></li>
			<li><a href="list.jsp">목록</a></li>
			<li><a href="add.jsp">추가</a></li>
			<%--
					추가할 데이터를 입력받는 페이지
					입력받은 데이터를 리스트에 추가하는 페이지
			 --%>
		</ul>
	</nav>
</header>