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
<script type="text/javascript">
	function showAlert() {
		alert('이메일이 정확한지 확인해 주세요.');
	}
	
	function knowAlert(){
		alert('이메일로 임시 비밀번호가 전송되었습니다.');
	}
</script>
<style type="text/css">
body{
	background-color: #343a40;
}

.page_total{
	width: 35rem;
	height: 100%;
	border-radius: 7px;
	overflow: hidden;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
}

hr{
	color: #ffc107
}
</style>
</head>
<body>
	        <!-- header section strats -->
    <header class="header_section" style="background-color: #343a40;">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
            <span>
              Mat.zip
            </span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>
        </nav>
      </div>
    </header>
	        <!-- End header section -->
    
    <div class="page_total" style="background-color: white; ">
	<form action="temporaryPw">
		<div class="member-container">
			<h1 style="text-align: center; margin-top: 20px;">LOGIN</h1>
			<hr style="border: solid 2px;">

			<div class="form-group">
				<label for="email">이메일</label> <input type="text"
					class="form-control  pl-1r" id="sendEmail" placeholder="발급 받을 이메일을 적어 주세요."
					name="sendEmail">
				<c:if test="${msg eq 'notMember'}">
					<p style="color: red;">가입 되지 않은 이메일입니다.</p>
					<p style="color: red;">회원가입을 먼저 진행해 주세요.</p>
				</c:if>
			</div>
			
			<div style="text-align: center;">
					<button type="submit" class="btn p2-10"
						style="width: 320px; background-color: #dcdcdc" id="loginCk" onclick="knowAlert();">임시 비밀번호 발급</button>
				<p style="text-align: center; font-size: small; margin: 10px 0px 0px 0px;">
			     	<a onclick="showAlert();" style="font-size: small; color: #ffc107; font-weight: 700; padding-left: 5px; cursor: pointer;">이메일이 오지 않았나요?</a>
			 	</p>
			</div>
			<hr style="border: solid 1px; margin-top: 10px;">
		</div>
	</form>
	<div class="member-container">
    	<div class="form-group">
			<p style="text-align: center; font-size: small;">
				맛.zip이 처음이신가요? <a href="signUp"
					style="font-size: small; color: #ffc107; font-weight: 700; padding-left: 5px;">회원가입</a>
			</p>
			<p style="text-align: center; font-size: small; margin: 13px 0px;">
			     맛.zip의 회원이신가요? <a href="login" style="font-size: small; color: #ffc107; font-weight: 700; padding-left: 5px;">로그인</a>
			 </p>
		</div>
    </div>
    </div>
</body>
</html>