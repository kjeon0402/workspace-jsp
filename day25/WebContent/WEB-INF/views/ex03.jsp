<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp - 포워딩 이후 출력되는 페이지</title>
</head>
<body>

<h1>ex03.jsp - 포워딩 이후 출력되는 페이지</h1>
<hr>
<h2>${now }</h2>
<form method="POST">
	<select name="number">
		<option>1</option>
		<option>2</option>
		<option>3</option>
	</select>
	<input type="submit">
</form>

<div style="width: 300px;
			height: 200px;
			background-image: url('http://221.164.9.222/img/iu${param.number }.jpg');
			background-repeat: no-repeat;
			background-size: 100%">
</div>	

</body>
</html>