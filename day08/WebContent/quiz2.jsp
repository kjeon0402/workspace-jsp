<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz2.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String box= request.getParameter("storeid");	// "on" or "null"

	if(id != null) {
		Cookie c = new Cookie("id", id);
		c.setMaxAge(box != null ? 86400 * 7 : 0);
		response.addCookie(c);
		response.sendRedirect("quiz2.jsp");
	}
%>

<h1>quiz2.jsp - ID 자동저장</h1>
<hr>

<form method="POST">
	<p><input type="text" name="id" placeholder="ID" value="${cookie.id.value }" autofocus></p>
	<p><input type="password" name="pw" placeholder="Password"></p>
	<p>
		<input type="checkbox" name="storeid" id="storeid" ${not empty cookie.id ? 'checked' : '' }>
		<label for="storeid">ID 저장하기</label>
	</p>
	<p><input type="submit" value="로그인"></p>
</form>
<%--
		1) 아이디와 비밀번호를 입력하면 현재 페이지(혹은 다른 페이지)에서 파라미터를 받는다
		2) 특별히 출력할 것은 ㅇ벗다
		3) 만약, 체크박스에 체크하고 입력하면 마지막으로 입력한 ID가 input에 입력되어 있다
		
		- checkbox가 전달하는 value는 지정하지 않으면 "on"이다(체크되지 않으면 null)
		- checkbox에는 checked 속성을 이용하여 처음부터 체크된 상태로 만들 수 있다
		- type="text"에는 value 속성에 값을 넣으면 미리 입력된 값을 만들 수 있다
 --%>
</body>
</html>