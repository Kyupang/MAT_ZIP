<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 수정 </title>
<meta charset="utf-8" content="charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<style type="text/css">
	input{
		margin-bottom: 15px;
	}
</style>

</head>
<body>
<header>
    <h1> &emsp; 맛집 </h1>      
</header>
	<hr style="border: solid 1px;">
	
	<div class="container">

  <h1 style="text-align: center">${memberInfo.nickName} 님의 정보</h1>
  <hr style="border: solid 2px;">

    <div class="form-group">
    
      <label for="user_id">이름</label>
     		<input type="email" class="form-control pl-1r" id="user_id" value="${memberInfo.name}" placeholder="이메일을 입력하세요." name="user_id">
	 
      <label for="password">닉네임</label>
      <input type="text" class="form-control pl-1r" id="password" value="${memberInfo.nickName}" placeholder="비밀번호를 입력하세요." name="password" onchange="pwCheckMethod()">
	 
      <label for="pwCheck">성별</label>
      <input type="text" class="form-control pl-1r" id="pwCheck" value="${memberInfo.gender}" placeholder="비밀번호를 한번 더 입력해 주세요." name="pwCheck" onchange="pwCheckMethod()">

      <label for="name">출생일자</label>
      <input type="text" class="form-control pl-1r" id="name" name = "name" value="${memberInfo.accountDate}" placeholder="이름을 입력하세요.">
    
      <label for="name">가입 일자</label>
      <input type="text" class="form-control pl-1r" id="name" name = "name" value="${memberInfo.accountDate}" placeholder="이름을 입력하세요.">

    <hr style="margin-top: 25px; margin-bottom: 25px;">
    <div style="margin: auto;">
        	<button type="submit" class="btn p2-10 bt-1" id="signUp" name="signUp" style="width: 100%;">정보 수정하기</button>
    </div>
    	</div>
    </div>
    
    <div class="container">
			  <p style="text-align: center; font-size: small;">
			     맛집 보러가기 <a href="/tastezip/totalUI.jsp" style="font-size: small; color: green; font-weight: 700; padding-left: 5px;">맛.zip</a>
			  </p>
</div>
</body>
</html>