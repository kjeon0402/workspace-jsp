<%@page import="order.OrderDAO"%>
<%@page import="guest.GuestDAO"%>
<%@page import="menu.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="menuDAO" value="<%=MenuDAO.getInstance()%>" />
<c:set var="guestDAO" value="<%=GuestDAO.getInstance() %>" />
<c:set var="orderDAO" value="<%=OrderDAO.getInstance() %>" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
	body {
		background-image: url('../31845.png');
		background-size:35%;
		padding: 150px 150px;
		padding-left:25%;
		padding-right : 25%;
		display:flex;
		justify-content: center;
		width: 50%;
		margin: 0;
	}
	
	form {
		background-color: #FFE08C;
	}
	
	div, ul {
		margin: 0;
		padding: 0;
	}
	
	li>a {
		display: block;
		color: inherit;
		text-decoration: none;
	}
	
	.aside {
		border-right: 2px solid black;
		width: 500px;
		list-style: none;
		height: 70px;
		margin: 0;
		display: flex;
		border: 2px solid black;
	}
	
	.aside>li {
		width: 100%;
		height: 70px;
		line-height: 70px;
		background-color: antiquewhite;
		text-align: center;
		font-size: 20px;
		font-weight: bold;
		cursor: pointer;
	}
	
	.aside>li:hover {
		background-color: burlywood;
	}
	
	.hidden {
		display: none;
	}
	
	.selected {
		background-color: chocolate !important;
		color: white !important;
	}
	
	.content {
		width: 500px;
		height: 500px;
		display: flex;
		justify-content: center;
		align-items: center;
		border: none;
		flex-flow: column;
	}
	.finish {
		display: flex;
		justify-content: center;
	}
	.hamburger li, .side li, .drink li {
		list-style: none;
		margin: 5px;
	}
	form img {
		width: 33px;
	}
	.cartBtn {
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="root">
		<ul class="aside">
			<li class="hamburger selected">햄버거</li>
			<li class="side">사이드</li>
			<li class="drink">음료</li>
		</ul>
		<input type="hidden" name="orderer" value="${login.name }">
		<input type="hidden" name="address" value="${login.address }">
		<form method="POST" action="${cpath }/shopping-basket.jsp">
			<div class="content">
				<div class="hamburger">
					<h2>햄버거 메뉴 판</h2>
					<br>
					<ul>
						<c:forEach var="KIND" items="${menuDAO.listHambuger('햄버거')}" varStatus="햄버거">
							<input type="hidden" name="product" value="${KIND.NAME }">
							<input type="hidden" name="price" value="${KIND.PRICE }">
							<li><img src="${cpath }/baseimage/${KIND.IMG }" width="100px"> | ${KIND.NAME } | ${KIND.PRICE } 
								<input type="button" value="-" class="minus"> 
								<input type="text" name="${KIND.NAME }" value="0" size="3"> 
								<input type="button" value="+" class="plus"> 
								<img class="cartBtn" src="../shopping-cart.png" data-name="${KIND.NAME }" data-price="${KIND.PRICE }">
							</li>
						</c:forEach>
					</ul>
				</div>

				<div class="side hidden">
					<h2>사이드 메뉴 판</h2>
					<br>
					<ul>
						<c:forEach var="KIND" items="${menuDAO.listHambuger('사이드') }"
							varStatus="사이드">
							<li><img src="${cpath }/baseimage/${KIND.IMG }" width="100px"> | ${KIND.NAME } | ${KIND.PRICE }  
								<input type="button" value="-" class="minus"> 
								<input type="text" name="${KIND.NAME }" value="0" size="3"> 
								<input type="button" value="+" class="plus">
								<img class="cartBtn" src="../shopping-cart.png" data-name="${KIND.NAME }" data-price="${KIND.PRICE }">
							</li>
						</c:forEach>
					</ul>
				</div>

				<div class="drink hidden">
					<h2>음료수 메뉴 판</h2>
					<br>
					<ul>
						<c:forEach var="KIND" items="${menuDAO.listHambuger('음료') }"
							varStatus="음료">
							<li><img src="${cpath }/baseimage/${KIND.IMG }" width="100px"> | ${KIND.NAME } | ${KIND.PRICE }  
								<input type="button" value="-" class="minus"> 
								<input type="text" name="${KIND.NAME }" value="0" size="3"> 
								<input type="button" value="+" class="plus">
								<img class="cartBtn" src="../shopping-cart.png" data-name="${KIND.NAME }" data-price="${KIND.PRICE }">
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="finish">
				<a href="${cpath }/shopping-basket.jsp"><button>장바구니로 이동</button></a>
			</div>
		</form>
	</div>
	<script>
		const menuList = document.querySelectorAll('.aside > li');
		const content = document.querySelector('.content');
		const contentList = content.querySelectorAll('div');
		// let idx = null;
		
		menuList.forEach((li, index) => {
			li.addEventListener('click', (event) => {
			// idx = index;
			
				menuList.forEach(menu => menu.classList.remove('selected'));
				menuList[index].classList.add('selected');
				contentList.forEach(content => content.classList.add('hidden'));
				contentList[index].classList.remove('hidden');
			});
		});
	    document.querySelectorAll('.plus').forEach(btn => {
	        btn.onclick = (event) => {
	            const currentValue = +event.target.previousElementSibling.value;
	            event.target.previousElementSibling.value = currentValue + 1;
	        };
	    });
	
	    document.querySelectorAll('.minus').forEach(btn => {
	        btn.onclick = (event) => {
	            const currentValue = +event.target.nextElementSibling.value;
	            if (currentValue == 0) {
	                alert('수량은 0 미만이 될 수 없습니다');
	                return;
	            }
	            event.target.nextElementSibling.value = currentValue - 1;
	        };
	    });
	    
	</script>
	
	<script>
		const cartBtnList = document.querySelectorAll('.cartBtn');
		cartBtnList.forEach(btn => {
			btn.onclick = (event) => {
				let url = '${cpath}/menu/add-basket.jsp';
				const name = event.target.dataset.name;
				const price = event.target.dataset.price;
				const cnt = event.target.parentNode.querySelector('input[type="text"]').value;
				console.log('name : ' + name);
				console.log('price : ' + price);
				console.log('cnt : ' + cnt);
				
				url += '?product=' + name;
				url += '&price=' + price;
				url += '&cnt=' + cnt;
				
				console.log(url);
				
				location.href = url;
			};
		});
	</script>

</body>
</html>