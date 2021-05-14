<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<% 	
	session.invalidate(); 
	response.sendRedirect(request.getContextPath());
%>
</body>
</html>