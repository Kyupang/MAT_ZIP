<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛.zip 로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<script type="text/javascript">

</script>

</head>
<body>
	<header>
		<h1>&emsp; 맛집</h1>
	</header>
	<hr style="border: solid 1px;">
	<form action="login" method="post">
		<div class="container">
			<h1 style="text-align: center">이메일 로그인</h1>
			<hr style="border: solid 2px;">

			<div class="form-group">
				<label for="email">이메일</label> <input type="email"
					class="form-control  pl-1r" id="user_id" placeholder="이메일을 입력하세요."
					name="user_id">
			</div>

			<div class="form-group">
				<label for="usr">비밀번호</label> <input type="text"
					class="form-control  pl-1r" id="password"
					placeholder="비밀번호를 입력하세요." name="password">
			</div>
			<hr>
			<div style="text-align: center;">
				<c:if test="${memberVal == null}">
					<button type="submit" class="btn p2-10"
						style="width: 320px; background-color: #dcdcdc" id="loginCk">로그인</button>
				</c:if>
				<c:if test="${msg eq 'miss'}">
			<p style="color: red;" >로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				</c:if>
			</div>
			<hr style="border: solid 1px;">
		</div>
	</form>
	<div class="container">
    	<div class="form-group">
			<p style="text-align: center; font-size: small;">
				맛.zip이 처음이신가요? <a href="signUp"
					style="font-size: small; color: green; font-weight: 700; padding-left: 5px;">회원가입</a>
			</p>
		</div>
    </div>
</body>
</html>