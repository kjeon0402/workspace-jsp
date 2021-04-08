<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
%>
<h3>Welcome Join!</h3>
<p><strong>Name</strong>	: <%=name %></p>
<p><strong>ID</strong>		: <%=id %></p>

</body>
</html>