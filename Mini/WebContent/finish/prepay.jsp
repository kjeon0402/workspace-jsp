<%@page import="menu.MenuDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../mypage-header.jsp" %>

${param.bigmac }
${param.wopper }
${param.shushu }
${param.softcorn }
${param.potato }
${param.twistpotato }
${param.coke }

<main>
<form action="${cpath }/finish/paycheck.jsp">
<%
	Enumeration<String> names = request.getParameterNames();
	HashMap<String, Integer> map = new HashMap<String, Integer>();

	while(names.hasMoreElements()) {
		String name = names.nextElement();
		int cnt = Integer.parseInt(request.getParameter(name));
		map.put(name, cnt);
// 		System.out.println(name + " : " + cnt);
// 		if(cnt != 0)	
	}
	
	ArrayList<MenuDTO> list = new ArrayList<MenuDTO>();
	
%>
${menuDAO. }

<c:if test="${param.bigmac != 0 }">
	<c:set var="menu" value="${menuDAO.selectOne('bigmac') }"/>
		<p>	
			<input type="text" name="product" value="${menu.NAME }">
			<input type="text" name="cnt" value="${param.bigmac }">
			<input type="text" name="orderer" value="${login.name }">
			<input type="text" name="address" value="${login.address }">
			<input type="text" name="price" value="${menu.PRICE }">
			<input type="text" name="total" value="${menu.PRICE * param.bigmac }">
		</p>
</c:if>
<c:if test="${param.wopper != 0 }">
	<c:set var="menu" value="${menuDAO.selectOne('wopper') }"/>
		<p>
			<input type="text" name="product" value="${menu.NAME }">
			<input type="text" name="cnt" value="${param.wopper }">
			<input type="text" name="orderer" value="${login.name }">
			<input type="text" name="address" value="${login.address }">
			<input type="text" name="price" value="${menu.PRICE }">
			<input type="text" name="total" value="${menu.PRICE * param.wopper }">
		</p>
</c:if>
<c:if test="${param.shushu != 0 }">
	<c:set var="menu" value="${menuDAO.selectOne('shushu') }"/>
		<p>
			<input type="text" name="product" value="${menu.NAME }">
			<input type="text" name="cnt" value="${param.shushu }">
			<input type="text" name="orderer" value="${login.name }">
			<input type="text" name="address" value="${login.address }">
			<input type="text" name="price" value="${menu.PRICE }">
			<input type="text" name="total" value="${menu.PRICE * param.shushu }">
		</p>
</c:if>
<c:if test="${param.softcorn != 0 }">
	<c:set var="menu" value="${menuDAO.selectOne('softcorn') }"/>
		<p>
			<input type="text" name="product" value="${menu.NAME }">
			<input type="text" name="cnt" value="${param.softcorn }">
			<input type="text" name="orderer" value="${login.name }">
			<input type="text" name="address" value="${login.address }">
			<input type="text" name="price" value="${menu.PRICE }">
			<input type="text" name="total" value="${menu.PRICE * param.softcorn }">
		</p>
</c:if>
<c:if test="${param.potato != 0 }">
	<c:set var="menu" value="${menuDAO.selectOne('potato') }"/>
		<p>
			<input type="text" name="product" value="${menu.NAME }">
			<input type="text" name="cnt" value="${param.potato }">
			<input type="text" name="orderer" value="${login.name }">
			<input type="text" name="address" value="${login.address }">
			<input type="text" name="price" value="${menu.PRICE }">
			<input type="text" name="total" value="${menu.PRICE * param.potato }">
		</p>
</c:if>
<c:if test="${param.twistpotato != 0 }">
	<c:set var="menu" value="${menuDAO.selectOne('twistpotato') }"/>
		<p>
			<input type="text" name="product" value="${menu.NAME }">
			<input type="text" name="cnt" value="${param.twistpotato }">
			<input type="text" name="orderer" value="${login.name }">
			<input type="text" name="address" value="${login.address }">
			<input type="text" name="price" value="${menu.PRICE }">
			<input type="text" name="total" value="${menu.PRICE * param.twistpotato }">
		</p>
</c:if>
<c:if test="${param.coke != 0 }">
	<c:set var="menu" value="${menuDAO.selectOne('coke') }"/>
		<p>
			<input type="text" name="product" value="${menu.NAME }">
			<input type="text" name="cnt" value="${param.coke }">
			<input type="text" name="orderer" value="${login.name }">
			<input type="text" name="address" value="${login.address }">
			<input type="text" name="price" value="${menu.PRICE }">
			<input type="text" name="total" value="${menu.PRICE * param.coke }">
		</p>
</c:if>
<p><input type="submit" value="확인"></p>
</form>
</main>

</body>
</html>