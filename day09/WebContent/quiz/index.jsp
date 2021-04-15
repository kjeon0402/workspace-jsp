<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- begin of header -->
<%@ include file="header.jsp" %>
<!--  end of header -->
<%--
		1) day07 프로젝트(Book)의 내용을 그대로 가져오세요
		2) 로그인 기능을 추가합니다
		3) 로그인된 사용자가 있으면 header 우측 상단에 사용자 이름과 id를 표기합니다
		4) 목록은 누구나 확인할 수 있으나, 생성, 수정, 삭제는 로그인된 사용자만 접근할 수 있도록 처리하세요
		5) 로그인 기본 시간은 10분으로 처리하고, 우측 상단에 로그인 사용자 이름 옆에 로그아웃 버튼을 만들어주세요
		6) EL, JSTL를 사용할 수 있으면 기존 코드를 변경하셔도 됩니다
 --%>

<c:set var="indexImg" value="http://221.164.9.222/img/iu.jpg" />

<main>
	<img src="${indexImg }" width="500px">
</main>

<footer>
<!-- begin of footer -->
<%@ include file="footer.jsp" %>
<!-- end of footer -->
</footer>


</body>
</html>