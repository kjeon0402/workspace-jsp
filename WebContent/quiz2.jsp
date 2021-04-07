<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz2.jsp</title>
<style>
        body {
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .root {
            width: 500px;
        }
        .title {
            color: #00c850;
            display: flex;
            justify-content: center;
            font-size: 25pt;
        }
        .box {
            width: 100%;
            font-weight: bold;
        }
        .box > p {
            margin-bottom: 5px;
            font-size: 11pt;
        }
        .box > input {
            padding: 5px;
            width: 97%;
            height: 25px;
            cursor: pointer;
        }
        .gender > select {
            padding: 10px;
            width: 500px;
        }
        
        .birth > input {
            width: 140px;
        }
        .birth > select {
            padding: 10px;
            width: 160px;
        }
        .phoneNumber > .nationalNumber {
            width: 97%;
            height: 25px;
            padding: 5px;
            cursor: pointer;
            border: 1px solid black;
            margin-bottom: 5px;
        }
        input[type="submit"] {
            all: unset;
            background-color: #00c850;
            color: white;
            font-size: 18px;
            text-align: center;
            width: 500px;
            height: 39px;
            margin-top: 20px;
            line-height: 39px;
            cursor: pointer;
        }
    </style>
</head>
<body>

	<!-- 
		1) vscode나 다른 프로그램으로 naver_join.html 파일을 작성하세요
			네이버 회원가입 페이지를 참조해서 만들면 됩니다
			가능하면 css도 같이 꾸며주세요
		2) naver_join.html의 코드를 jsp로 가져와서 form이 작동할 수 있도록 설정합니다
		
		3) 회원가입 페이지에서 전달하는 다양한 사용자 입력값을 jsp를 이용하여 보기 좋게 정렬하여
			화면에 출력하는 naver_join_result.jsp 파일을 작성하세요
	 -->
<form action="quiz2-result.jsp">
	 <div class="root">
        <div class="title"><h1>NAVER</h1></div>
        <div class="box id">
            <p>아이디</p>
            <input type="text" name="id">
        </div>
        <div class="box password">
            <p>비밀번호</p>
            <input type="password" name="password">
        </div>
        <div class="box pwCheck">
            <p>비밀번호 재확인</p>
            <input type="password" name="password">
        </div>
        <br>
        <div class="box name">
            <p>이름</p>
            <input type="text" name="name">
        </div>
        <div class="box birth">
            <p>생년월일</p>
            <input type="text" name="year" placeholder="년(4자)">
            <select name="month">
                <option>월</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
            </select>
            <input type="text" name="date" placeholder="일">
        </div>
        <div class="box gender">
            <p>성별</p>
            <select name="gender">
                <option>성별</option>
                <option>남자</option>
                <option>여자</option>
                <option>선택 안함</option>
            </select>
        </div>
        <div class="box email">
            <p>본인 확인 이메일</p>
            <input type="text" name="email" placeholder="선택입력">
        </div>
        <div class="box phoneNumber">
            <p>휴대전화</p>
            <div class="nationalNumber">대한민국 +82</div>
            <input type="text" name="phoneNumber" placeholder="전화번호 입력">
        </div>
        <p><input type="submit" value="가입하기"></p>
     </div>
</form>
</body>
</html>