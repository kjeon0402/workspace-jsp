<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("UTF-8"); %>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<style>
	body{
		padding:0;
		margin: 0 ;
		background-image: url('31845.png');
		background-size:35%;
		width: 100%;
		height: 1800px;
	}
	div,ul{
		margin:0;
		padding:0;
	}
	
	.showmain{
		position :relative;
		border-radius : 30px;
		justify-content: center;
		background-color: white; 
		background-size: cover;
		margin-top : 10%;
		margin-left :18%;
		margin-right: 18%; 
		margin-bottom: 5%;
		padding: 20px 0px;
		text-align: center;
	}
	.showmain::before{
		content:"";
		background-image : url('minihamburger.png');
		border-radius : 30px;
		background-size : cover;
		opacity: 0.5;
		position : absolute;
		top:0px;
		left: 0px;
		right:0px;
		bottom : 0px;
	}
	
	h1 {
		
		display:flex;
		justify-content: center;
		text-align:center;
		padding-top : 15px;
		height : 100px;
		font-size: 50;
		font-family: fantasy;
		position: relative;
	}
	nav {
		
		height : 100px;
		display:flex;
		justify-content: center;
		font-size: 60;
		font-family: fantasy;
	
		
	}
	nav > ul {
		display:flex;
		height: 100%;
		width: 50%;
		justify-content: space-between;
	}
	nav > ul > li {
		list-style :none;
		display: flex;
		height: 100%;
		padding-left: 30px;
		padding-right: 45px;
		color: background;
		
	}
	nav > ul > li > a > button {
		color:rgb(155,97,88);
		border-radius:10px;
		font-size : 20px;
		list-style :none;
		padding-left:10px;
		padding-right:10px;
		height: 60px;
		background-color: #FFE08C;
		position: relative;
	}
	
	
	.upright{
		display:flex;
		justify-content: flex-end;
		height: 30px;
		font-size: 8;
		padding-right: 25px;
		padding-top: 20px;
	}
	.logout1{
		padding-right: 20px;
	}
	.logout1 > a > button {
		color:rgb(155,97,88);
		border-radius : 10px;
		background-color: #FFE08C;
	}
	.master > a > button{
		color:rgb(155,97,88);
		border-radius : 10px;
		background-color: #FFE08C;
	}
	.login-info {
		margin-bottom: 15px;
		font-weight: bold;
		font-size: 20px;
	}
	h1 > a {
		text-decoration: none;
		color: inherit;
	}
</style>
</head>
	<body>
		<header>
			<div class="upright">
				<div class="logout1">
					<a href="${cpath }/member/${not empty login ? 'headerlogout' : 'loginplz' }.jsp">
						<button>${not empty login ? '????????????' : '????????????' }</button>
					</a>
				</div>
				<div class="master">
					<a href="${cpath }/Master/Master2.jsp"><button>?????????</button></a>
				</div>
			</div>
			
			<div class="showmain">
			<h1><a href="${cpath }">????????? ??????</a></h1>
			<div class="login-info">
				<c:if test="${not empty login }">
					<strong>${login.name }</strong>(${login.id })??? ???????????????.
				</c:if>
			</div>
				<nav>
					<ul>
						<li>
							<c:if test="${not empty login }">
							<a href="${cpath }/menu/MainMenu.jsp">
								<button>????????????</button>
							</a>
							</c:if>
							<c:if test="${empty login }">
							<a href="${cpath }/member/join.jsp">
								<button>????????????</button>
							</a>
							</c:if>
							
						</li>
				
						<li>
							<a href="${cpath }/member/${not empty login ? '../mypage-header' : 'login' }.jsp">
								<button>${not empty login ? '???????????????' : '?????????' }</button>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>
	</body>
</html>

