<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="${pageContext.request.contextPath}/resources/css/responsive.css" rel="stylesheet" />
<style type="text/css">
body{
	background-color: #343a40;
}

.img-box{
	width: 180px;
	height: 180px;
	border-radius: 50%;
	border: 5px solid #ffbe33;
	overflow: hidden;
	padding-bottom: 0px;
	padding-top: 0px;
	margin-bottom: 20px;
	margin-top: 20px;
}

.profile{
	width: 100%;
	height: 100%;
	object-fit:cover;
}

.myPage-margin-size{
	margin-left: 30px;
	margin-right: 30px;
}

.a-tag{
	font-size: 1.1em;
	padding: 0;
}

.member-Info-container{
	min-width: 550px;
	width: 550px;
	padding-left: 20px;
	padding-right: 20px;
}

.member-Info-container a{
	display: inline-block;
	padding: 10px 20px;
	background-color: #ffbe33;
	color: white;
	transition: 0.3s;
	margin-top: 10px;
	border-radius: 30px;
}

.memberInfo1{
	width: 90%;
	margin-bottom: 20px;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
}

.memberInfo1 input{
	padding-left: 1rem;
    padding-right: 2.75rem;
    padding-top: 15px;
    padding-bottom: 15px;
}
.memberInfo1 label{
	font-size: 13px;
}
</style>
</head>
<body >
	        <!-- header section strats -->
    <header class="header_section" style="background-color: #343a40;">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="/zip/index.jsp">
            <span>
              Mat.zip
            </span>
          </a>
        </nav>
      </div>
    </header>
    
<div class="member-Info-container" style="top: 140px; left: 20%; position: absolute; height: 700px; background-color: white; border-radius: 20px;">
<div class="member-Info">
<div class="img-box myPage-margin-size" style="background: #ffffff; margin-left: auto; margin-right: auto;">
	<c:if test="${memberInfo.profile == null}">
	<img class="profile" src="${pageContext.request.contextPath}/resources/images/basic.png">
	</c:if>
	<c:if test="${memberInfo.profile != null}">
	<img class="profile" src="${pageContext.request.contextPath}/resources/images/${memberInfo.profile}">
	</c:if>
</div>
</div>
<div style="text-align: center;">
<h1 class="myPage-margin-size" style="font-size: 40px;">${memberInfo.nickName}</h1>
	<p style="font-weight: 700; font-size: 2rem; margin-bottom: 5px; margin-left: 10px">${memberInfo.mark}</p>
	<p style="font-weight: 700; font-size: 1.5rem; margin: 0;">(보유한 포인트: ${memberInfo.point} p)</p>
	<div>
	<span>카테고리 1</span>
	<span>카테고리 2</span>
	<span>카테고리3</span>
	</div>
</div>

<!-- 영휘님 포인트 사용으로 넘어가는 a태그 -->
<h3 class="myPage-margin-size" style="text-align: center;"><a href="/point/gifticon" class="a-tag">포인트 사용</a></h3>

<div class="memberInfo1">
	  <label for="name">이름</label>
      <input type="text" class="form-control pl-1r" id="name" value="${memberInfo.name}" name="name" disabled="disabled">
	 
      <label for="birthDate">출생일자</label>
      <input type="date" class="form-control pl-1r" id="birthDate" name = "birthDate" value="${memberInfo.birthDate}">
    
      <label for="regDate">가입 일자</label>
      <input type="text" class="form-control pl-1r" id="regDate" name = "regDate" value="${memberInfo.accountDate}" disabled="disabled">
</div>
      
<h3 class="myPage-margin-size" style="text-align: center;"><a href="deleteAccount" class="a-tag">회원 탈퇴</a>
<a href="changeInfo" class="a-tag">정보 수정</a>
<a href="changeInfo" class="a-tag">비밀번호 수정</a></h3>
</div>

<div class="member-Info-container" style="top: 140px; right: 20%; position: absolute; width: 550px; height: 335px; background-color: white; border-radius: 20px;">
<div style="margin-top: 20px;">
<h1 class="myPage-margin-size" style="font-size: 40px;">DDO chelin of ${memberInfo.nickName}</h1>
<hr style="">
</div>
</div>

<div class="member-Info-container" style="top: 500px; right: 20%; position: absolute; width: 550px; height: 335px; background-color: white; border-radius: 20px;">
<div style="margin-top: 20px;">
<h1 class="myPage-margin-size" style="font-size: 40px;">leaved ${memberInfo.nickName}'s feedback</h1>
<hr>
</div>
</div>
</body>
</html>