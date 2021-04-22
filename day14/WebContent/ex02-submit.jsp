<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-submit.jsp</title>
</head>
<body>
<%@ page import="java.sql.*, day14.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="inputData" class="day14.MemberDTO" />	<%-- 총 속성값은 4개이지만 --%>
<jsp:setProperty property="*" name="inputData" />		<%-- 파라미터는 2개만 넘어온다 --%>
<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select * from member where id=? and pw=?";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url, "c##itbank", "it");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, inputData.getId());
	pstmt.setString(2, inputData.getPw());
	ResultSet rs = pstmt.executeQuery();
	MemberDTO login = null;
	
	while(rs.next()) {
		login = new MemberDTO();
		login.setAge(rs.getInt("age"));
		login.setId(rs.getString("id"));
		login.setPw(rs.getString("pw"));
		login.setName(rs.getString("name"));
	}
	session.setAttribute("login", login);	// null이면 null인 채로, 객체가 있으면 객체를 세션에 저장
// 	rs.getMetaData(); : 줄 수와 각 컬럼이름과 데이터에 접근할 수 있는 객체
	
%>
<h2>로그인 ${empty login ? '실패' : '성공 : ' } ${login.id }, ${login.name }, ${login.age }</h2>
</body>
</html>