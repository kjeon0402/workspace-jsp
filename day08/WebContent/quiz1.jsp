<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
<style>
	body {
		font-family: 'Consolas';
	}
	header > div {
		display: flex;
		justify-content: flex-end;
	}
	main pre {
		font-size: 20px;
		font-family: 'Consolas';
	}
	.basic {
		background-color: white;
		color: black;
	}
	.dark {
		background-color: black;
		color: white;
	}
	.blue {
		background-color: skyblue;
		color: royalblue;
	}
	.green {
		background-color: green;
		color: lime;
	}
</style>
</head>
<%
	String theme = request.getParameter("theme");

	if(theme != null) {	// 입력값이 있으면 입력값을 이용하여 쿠키를 만들고, 클라이언트에 보내둔다(스탬프를 찍어준다)
		Cookie c = new Cookie("theme", theme);
		c.setMaxAge(86400 * 7);
		response.addCookie(c);
		response.sendRedirect("quiz1.jsp");	// GET방식 요청으로 현재 페이지를 다시 요청함(POST가 아님)
	}
	
	Cookie[] arr = request.getCookies();
	if(arr != null) {	// 쿠키가 있으면
		for(Cookie coo : arr) {
			switch(coo.getName()) {		// equals 대신 switch ~ case
			case "theme" : 				// 자바의 switch는 문자열도 비교할 수 있다
				pageContext.setAttribute("themeCookieValue", coo.getValue());
				break;
			}
		}
	}
%>
<body class="${themeCookieValue }">

<header>
	<h1>quiz1.jsp - 테마 쿠키에 저장하기</h1>	
	<div>
		<form method="POST">
			<select name="theme">					<!-- 글자 / 배경 -->
				<option ${themeCookieValue == 'basic' ? 'selected' : ' ' } value="basic">Basic</option>	<!-- black / white -->
				<option ${themeCookieValue == 'dark' ? 'selected' : ' ' } value="dark">Dark</option>		<!-- white / black -->
				<option ${themeCookieValue == 'blue' ? 'selected' : ' ' } value="blue">Blue</option>		<!-- blue / skyblue -->
				<option ${themeCookieValue == 'green' ? 'selected' : ' ' } value="green">Green</option>	<!-- red / salmon -->
			</select>
			<input type="submit" value="테마 변경">
		</form>
	</div>
</header>
<hr>
<main>
<h2>Shape of you</h2>
<pre>
	The club isn’t the best place to find a lover
	So the bar is where I go
	Me and my friends at the table doing shots
	drinking fast and then we talk slow
	you come over and start up a conversation
	with just me and trust me
	I’ll give it a chance now
	Take my hand stop, put van the man
	on the jukebox and then we start to dance
	And now I’m singing like
	Girl you know I want your love
	Your love was handmade for somebody like me
	Come on now follow my lead
</pre>

<ul>
	<li>쿠키는 브라우저에 저장되므로, 서버의 상태와 무관하게 값을 불러와서 활용할 수 있다</li>
	<li>서로 다른 페이지에서도 쿠키를 참조할 수 있다</li>
	<li>쿠키는 즉시 적용되지 않고, 클라이언트가 다음 요청을 전송했을 때 사용할 수 있다</li>
</ul>
</main>

</body>
</html>