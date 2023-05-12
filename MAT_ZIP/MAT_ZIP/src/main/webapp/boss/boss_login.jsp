<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>login</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- <script type="text/javascript">
	$(function() {
		$('#b1').click(function() {
			$.ajax({
				url : "Board_list",
				success : function(x) {
					$("#result").html(x);
				},
				error : function() {
					alert('computer요청 실패!')
				}//error
			})//ajax
		})//b1
	})//$
</script> -->
<style>
html, body {
	height: 100%;
	background: #ffffff;
}

#container {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	height: 100%;
}

#loginBox {
	width: 300px;
	text-align: center;
	background-color: #ffffff;
}

.input-form-box {
	border: 0px solid #ff0000;
	display: flex;
	margin-bottom: 10px;
}

.input-form-box>span {
	display: block;
	text-align: left;
	padding-top: 5px;
	min-width: 65px;
}

.button-login-box {
	margin: 10px 0;
}

#loginBoxTitle {
	color: #198754;
	font-weight: bold;
	font-size: 42px;
	text-transform: uppercase;
	padding: 5px;
	margin-bottom: 20px;
	background: linear-gradient(to right, #198754, #8ca6ce);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

#inputBox {
	margin: 10px;
}

#inputBox button {
	padding: 3px 5px;
}
</style>
</head>
<script>
function loginSubmit() {
  // 여기에 필요한 검증 로직 추가
  return true;
}

function goBack() {
  window.history.back();
}
</script>
<body class="text-center">
	<div id="container">
		<div id="loginBox">

			<div id="loginBoxTitle">맛.Zip로그인</div>

			<div id="inputBox">
				<form action="member_login" method="post">
    <div class="input-form-box">
        <input name="user_id" placeholder="아이디" style="width: 100%; height: 50px;">
    </div>

    <div class="input-form-box">
        <input name="password" placeholder="비밀번호" style="width: 100%; height: 50px;">
    </div>

    <div class="button-login-box">
        <button type="submit" class="btn btn-success" style="width: 100%; height: 50px;" id="b1">로그인</button>
    </div>
    <div class="button-back-box">
        <button type="button" class="btn btn-secondary" onclick="goBack()" style="width: 100%; height: 50px;">이전 페이지로</button>
    </div>
</form>
<!-- 로그인 실패 메시지를 출력하는 부분 -->
 <div style="color: $red-500;">${msg}</div>
                
			</div>
			
			<hr color="green">
			<!-- 네이버 로그인 버튼 노출 영역 -->
			<div id="naver_id_login"></div>
			<!-- //네이버 로그인 버튼 노출 영역 -->
			<script type="text/javascript">
				var naver_id_login = new naver_id_login("W4mJUHq9ag5OTJvCCgzU",
						"http://localhost:8887/mvc200/callback.jsp");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("white", 2, 40);
				naver_id_login.setDomain("http://localhost:8887/mvc200");
				naver_id_login.setState(state);
				//naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
				
			</script>
			
			<%-- <hr color ="green">
	<h1 style= "color:green;">${id}님이 로그인 중입니다 ~!</h1>
	
	<a href="board2.jsp">
	<button style="background: grey ">게시판 화면으로 go</button>
	</a> --%>
		</div>
	</div>

</body>
</html>