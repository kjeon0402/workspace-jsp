<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="day10.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	List<Member> list = Arrays.asList(new Member[] {
		new Member("captain", "1234", "steve"),	
		new Member("ionman", "1234", "tony"),	
		new Member("thor", "1234", "thunder"),	
		new Member("hulk", "1234", "bruce")	
	});

	Member login(Member user) {
		for(Member m : list) {
			if(m.getId().equals(user.getId()) && m.getPw().equals(user.getPw())) {
				return m;	// 로그인 성공
			}
		}
		return null;		// 로그인 실패
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="day10.Member" />	<%-- Member user = new Member(); --%>
<jsp:setProperty property="*" name="user" />
<%
	String storeid = request.getParameter("storeid");
	String keepSession = request.getParameter("keepSession");
	
	Member loginUser = login(user);
	
	if(loginUser != null) {	// 로그인 성공시
		session.setAttribute("login", loginUser);
	
		// 아이디 저장에 체크가 되어 있으면
		if(storeid != null) {
			Cookie c = new Cookie("id", loginUser.getId());
			c.setMaxAge(86400 * 7);
			response.addCookie(c);
		}
		
		// 로그인 유지에 체크가 되어 있으면
		if(keepSession != null) {
			Cookie jsid = new Cookie("id", session.getId());
			jsid.setMaxAge(600);
			response.addCookie(jsid);
		}
		
		response.sendRedirect(request.getContextPath() + "/login-result.jsp");
	} else {	// 로그인 실패시
		session.removeAttribute("login");
	
		Cookie c = new Cookie("id", null);
		c.setMaxAge(0);
		response.addCookie(c);
		
		response.sendRedirect(request.getContextPath() + "/quiz.jsp");
	}
%>
</body>
</html>