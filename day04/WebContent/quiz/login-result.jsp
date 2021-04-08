<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="day04.Member" %>

<%!
	Member[] members = {
		new Member("jieon", "0402", "강지언"),
		new Member("pikachu", "112", "피카츄"),
		new Member("faker", "888", "이상혁")
	};
%>
<jsp:useBean id="login" class="day04.Member"/>
<jsp:setProperty property="*" name="login"/>
<%
	String str = "로그인 실패";
	for(Member m : members) {
		if(m.equals(login)) {
			str = m.getName() + "님, 안녕하세요";
			break;
		}
	}
	if("로그인 실패".equals(str)) {
		response.sendRedirect("index.jsp");
	}
%>
<h3><%=str %></h3>

</body>
</html>