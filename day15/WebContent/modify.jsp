<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%--
		로그인된 사용자에 한해서, 현재 접속자의 정보를
		form 태그 내부에 값이 입력된 상태로 출력해주고
		사용자가 값을 변경한 후 전송하면 
		pw, name, age에 대해서 변경된 값을 DB에 반영한다
		
		pw는 값이 미리 입력된 상태로 만들 경우, 코드 상에서 노출될 수 있으므로, 미리 완성시키지 않는다
		
		pw가 변경되면, 다시 로그인하도록 할 것인가?
		아니면 현재 세션의 값을 자동으로 변경해주고, 로그인 상태는 유지시킬 것인가
 --%>

<c:if test="${empty login }">
	<script>
		alert('로그인이 필요한 메뉴입니다.');
		location.href = '${cpath }/login.jsp';
	</script>
</c:if>

<c:if test="${not empty login }">
	<form method="POST" action="modify-submit.jsp">
		<p>
			<input type="hidden" name="id" value="${login.id }">
			<strong>${login.id }</strong>
		</p>
		<p><input type="password" name="pw" placeholder="PASSWORD"></p>
		<p><input type="text" name="name" value="${login.name }" placeholder="NAME"></p>
		<p><input type="number" name="age" value="${login.age }" placeholder="AGE"></p>
		<p><input type="submit" value="정보 수정"></p>
	</form>
</c:if>

</body>
</html>