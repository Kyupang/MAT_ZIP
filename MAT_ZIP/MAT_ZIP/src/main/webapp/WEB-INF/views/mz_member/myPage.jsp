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
.img-box{
	width: 200px;
	height: 200px;
	border-radius: 50%;
	overflow: hidden;
	padding-bottom: 0px;
	padding-top: 0px;
}
.profile{
	width: 100%;
	height: 100%;
	object-fit:cover;
}
.myPage-margin-size{
	margin-left: 30px;
}
.a-tag{
	font-size: 1.1em;
	padding: 0;
}
</style>
</head>
<body >
	        <!-- header section strats -->
    <header class="header_section" style="background-color: #343a40;">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.jsp">
            <span>
              Mat.zip
            </span>
          </a>
        </nav>
      </div>
    </header>
    
<div class="img-box myPage-margin-size" style="background: #ffffff; float: left">
	<c:if test="${memberInfo.profile == null}">
	<img class="profile" src="${pageContext.request.contextPath}/resources/images/basic.png">
	</c:if>
	<c:if test="${memberInfo.profile != null}">
	<img class="profile" src="${pageContext.request.contextPath}/resources/images/${memberInfo.profile}">
	</c:if>
</div>
<div style="float: left; padding-top: 77px; margin-left: 15px;">
	<p style="font-weight: 700; font-size: 2rem; margin-bottom: 10px; margin-left: 10px">${memberInfo.mark}</p>
	<p style="font-weight: 500; font-size: 25px; margin: 0;">(보유한 포인트: ${memberInfo.point} p)</p>
</div>
<div style="clear: both;">
<h1 class="myPage-margin-size">${memberInfo.nickName}</h1>
<hr>
<h3 class="myPage-margin-size"><a href="changeInfo" class="a-tag">회원 정보 수정</a></h3>
<hr>
<h3 class="myPage-margin-size"><a href="pastReview" class="a-tag">작성한 리뷰 보기</a></h3>
<hr>
<h3 class="myPage-margin-size"><a href="deleteAccount" class="a-tag">회원 탈퇴</a></h3>
<hr>
<h3 class="myPage-margin-size"><a href="askQuestion" class="a-tag">FAQ</a></h3>
</div>
</body>
</html>