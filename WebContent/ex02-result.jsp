<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	JSP에는 HTML코드와 Java코드가 같이 존재하지만
	실행될 때는 항상 Java코드 혹은 JSP코드가 먼저 작동하고, 이후 자바의 실행이 끝나면
	HTML과 결합하여 최종 완성된 응답(response)을 만들어낸다
 -->
<%	// scriptlet
	// HTML에서 type이 number이더라도, 전달 받을 때에는 String으로 받는다
	// request : 사용자의 요청, 요청 주소, [요청자의 입력값], 요청자의 IP 등...
	// 사용자가 브라우저에서 입력하는 대부분의 값은 문자열 형식으로 처리할 수 있다
	// number, text, password, date, checkbox, radio, select... (파일 요소는 문자열로 표현 불가)
	// jsp -> java -> class
	// jsp(2) -> java(2) -> class(2), 컴파일하기 위해서는 저장을 해야한다
	
	String n1 = request.getParameter("n1");		// <input name="n1" value="12">
	String n2 = request.getParameter("n2");		// <input name="n2">
	
	int num1 = Integer.parseInt(n1);
	int num2 = Integer.parseInt(n2);
%>
<p><%=n1 %> + <%=n2 %> = <%=num1 + num2 %></p>
<a href="ex02.jsp"><button>이전 페이지로</button></a>

</body>
</html>