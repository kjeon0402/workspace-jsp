<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>

	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST" class="my-form">
			<p><input type="text" name="id" placeholder="ID" value="${cookie.id.value }"></p>
			<p><input type="password" name="pw" placeholder="Password"></p>
			<p>
				<label>
					<input type="checkbox" name="storeid" ${not empty cookie.id ? 'checked' : '' }>
					ID저장
				</label>
			</p>
			<p><input type="submit" value="로그인"></p>	
		</form>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="user" class="day09.Account" />
		<jsp:setProperty property="*" name="user" />
		<%
			// jsp:useBean은 내장객체에 값을 넣는 형태지만, 그 자체로도 기본 생성자를 호출하므로 스크립틀릿 내부 지역변수로 참조 가능
			// 로그인 성공 시에만 쿠키를 만들어서 보내자
			Cookie c = new Cookie("id", user.getId());
			String box = request.getParameter("storeid");
			c.setMaxAge(box != null ? 86400 : 0);
			response.addCookie(c);
		%>
		<c:forEach var="m" items="${memberList }">
			<c:if test="${user.id == m.id and user.pw == m.pw }">
				<c:set var="login" value="${m }" scope="session" />
				<% session.setMaxInactiveInterval(600); %>
				<c:redirect url="/quiz" />
			</c:if>
		</c:forEach>
		<c:redirect url="login.jsp" />
	</c:if>
</main>


<footer>
<!-- begin of footer -->
<%@ include file="footer.jsp" %>
<!-- end of footer -->
</footer>