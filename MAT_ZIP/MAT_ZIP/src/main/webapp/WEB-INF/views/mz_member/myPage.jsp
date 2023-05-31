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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 포인트 조회 AJAX -->
<script type="text/javascript">


	$(function() {
		$('#result').empty()
		$.ajax({
			type : 'post',
			url : "${pageContext.request.contextPath}/point/pointinquiry",
			success : function(data) {
				$('#result').append(data)
			},
			error : function(error) {
				console.error('Error:', error);
			}
		})//ajax
	})//$

</script>
<script>
        function showPopup(){
            window.open("${pageContext.request.contextPath}/point/pointhistory","팝업 테스트","width=400, height=300, top=10, left=10");
        }
        
</script>
<script>
		function deleteAccount() {
			$('#updateInfo').attr('hidden', 'hidden');
			$('#updatePassword').attr('hidden', 'hidden');
			$('#deleteAccount').removeAttr('hidden');
			
			//가져온 값
			const userEmail = "${memberInfo.user_id}";
			const userPw = "${memberInfo.password}";
			
			//입력한 값
			const getEmail = $('#delEmail').val();
			const getPw = $('#delPw').val();
			
			if(getEmail != '' && getPw != ''){
				if (getEmail == userEmail && getPw == userPw) {
					var delConfirm = confirm('정말 계정을 탈퇴하십니까?');
						if (delConfirm) {
							alert('회원님의 계정이 탈퇴되었습니다.');
							document.getElementById('delete').submit();
						} else {
							alert('탈퇴가 취소 되었습니다.');
						}
				} else {
					document.getElementById('checkAccount').innerHTML='아이디 혹은 비밀번호가 일치하지 않습니다.';
			  		document.getElementById('checkAccount').style.color='red';
				}
			}
		}
		
		function updateSection() {
			$('#deleteAccount').attr('hidden', 'hidden');
			$('#updatePassword').attr('hidden', 'hidden');
			$('#updateInfo').removeAttr('hidden');
		}
		
		function updatePwFunction() {
			$('#deleteAccount').attr('hidden', 'hidden');
			$('#updateInfo').attr('hidden', 'hidden');
			$('#updatePassword').removeAttr('hidden');
			
			//입력한 값
			const getPw = $('#newPw').val();
			const getPwCheck = $('#newPwCheck').val();
			
			if (getPw != '' && getPwCheck != '') {
				if (getPw == getPwCheck) {
					var changeUserPw = confirm('비밀번호를 변경하시겠습니까?');
						if (changeUserPw) {
							alert('비밀번호가 변경되었습니다.');
							document.getElementById('updatePw').submit();
						} else {
							alert('비밀번호 변경이 취소되었습니다.');
						}
				} else {
					document.getElementById('checkNewPw').innerHTML='비밀번호가 일치하지 않습니다.';
			  		document.getElementById('checkNewPw').style.color='red';
				}
			}
		}
        
</script>
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

.page-total {
	width: 1200px;
	height: 700px;
	margin-left: auto;
	margin-right: auto;
}

@media (max-width: 1200px) {
	.page-total {
	margin-left: 20px;;
	margin-right: 20px;
	height: 700px;
	}
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
	min-width: 300px;
	float: left;
  	width: 48%;
	padding-left: 20px;
	padding-right: 20px;
	margin-left: 20px;
}

.member-Info-container2{
	min-width: 300px;
	float: right;
	padding-left: 20px;
	padding-right: 20px;
	width: 550px; 
	height: 335px; 
	background-color: white; 
	border-radius: 20px;
}

.member-Info-container a{
	display: inline-block;
	padding: 10px 20px;
	background-color: #ffbe33;
	color: black;
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

  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  .tableHeader thead th{
  	position: sticky;
  	top: 0px;
  	color: white;
  	background: black;
  }
  .tableHeader tbody tr td a{
  	color: black;
  }
</style>
</head>
<body >
	        <!-- header section strats -->
    <header class="header_section" style="background-color: #343a40;">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
            <span>
              Mat.zip
            </span>
          </a>
        </nav>
      </div>
    </header>
    
<div class="page-total">
<div class="member-Info-container" style="height: 700px; background-color: white; border-radius: 20px;">
<div class="member-Info">
<div class="img-box myPage-margin-size" style="background: #ffffff; margin-left: auto; margin-right: auto;">
	<c:if test="${memberInfo.profile == null}">
	<img class="profile" src="${pageContext.request.contextPath}/resources/images/basic.png">
	</c:if>
	<c:if test="${memberInfo.profile != null}">
	<img class="profile" src="${pageContext.request.contextPath}/resources/images/basic.png">
	</c:if>
</div>
</div>
	<div style="text-align: center;">
		<h1 class="myPage-margin-size" style="font-size: 40px;">${memberInfo.name}</h1>
		<p style="font-weight: 700; font-size: 2rem; margin-bottom: 5px; margin-left: 10px">${memberInfo.mark}</p>
		<div>
			<span style="font-weight: 700; font-size: 1.5rem; margin: 0;">
			(보유한 포인트: &nbsp;</span>
			<span style="font-weight: 700; font-size: 1.5rem; margin: 0;" id="result"></span>
			<span style="font-weight: 700; font-size: 1.5rem; margin: 0;">p)
			</span>
		</div>
		<div>
			<span>카테고리 1</span>
			<span>카테고리 2</span>
			<span>카테고리 3</span>
		</div>
	</div>
	<!-- 영휘님 포인트 내역 임시 위치 -->
	<!-- 영휘님 포인트 사용으로 넘어가는 a태그 -->
	<div>
		<h3 class="myPage-margin-size" style="text-align: center;">
				<a href="${pageContext.request.contextPath}/point/gifticon" class="a-tag">포인트 사용</a>
				<a class="a-tag" onclick="showPopup();">포인트 내역</a>
		</h3>
	</div>
	<form action="" id="">
	<div class="memberInfo1" id="updateInfo">
		  <label for="name">닉네임</label>
	      <input type="text" class="form-control pl-1r" id="name" value="${memberInfo.nickName}" name="name">
		 
	      <label for="birthDate" style="margin-top: 10px;">출생일자</label>
	      <input type="date" class="form-control pl-1r" id="birthDate" name = "birthDate" value="${memberInfo.birthDate}">
	    
	      <label for="regDate" style="margin-top: 10px;">가입 일자</label>
	      <input type="text" class="form-control pl-1r" id="regDate" name = "regDate" value="${memberInfo.accountDate}" disabled="disabled">
	</div>
	</form>
	
	<form action="delete" id="delete">
	<div class="memberInfo1" id="deleteAccount" hidden="hidden">
	      <label for="email">이메일</label>
	      <input type="email" class="form-control pl-1r" id="delEmail" name = "user_id" placeholder="가입할 때 사용하신 이메일을 적어 주세요." value="">
	    
	      <label for="password" style="margin-top: 20px;">비밀번호</label>
	      <input type="text" class="form-control pl-1r" id="delPw" name = "password" placeholder="가입할 때 사용하신 비밀번호를 적어 주세요." value="">
	      
	      <span id="checkAccount"></span>
	</div>
	</form>
	
	<form action="updatePw" id="updatePw">
	<div class="memberInfo1" id="updatePassword" hidden="hidden">
	      <label for="password">새로운 비밀번호</label>
	      <input type="text" class="form-control pl-1r" id="newPw" name = "password" placeholder="변경하실 비밀번호를 입력해 주세요.">
	      
	      <label for="pwCheck" style="margin-top: 20px;">새로운 비밀번호 확인</label>
	      <input type="text" class="form-control pl-1r" id="newPwCheck" name = "pwCheck" placeholder="위에 적으신 비밀번호를 한번 더 입력해 주세요.">

	      <span id="checkNewPw"></span>
	</div>
	</form>
      
	<h3 class="myPage-margin-size" style="text-align: center;">
		<a onclick="deleteAccount();" class="a-tag">회원 탈퇴</a>
		<a onclick="updateSection();" class="a-tag">정보 수정</a>
		<a onclick="updatePwFunction();" class="a-tag">비밀번호 변경</a>
	</h3>

</div>
<div>
</div>
<div style="height: 700px;">
<div class="member-Info-container2">
<div style="margin-top: 20px; height: 100%">
<h1 class="myPage-margin-size" style="font-size: 40px;">DDO chelin of ${memberInfo.nickName}</h1>
<hr>
<div style="overflow: auto; height: 70%">
<table class="tableHeader" style="width: 100%; text-align: center;'">
      <thead>
        <tr>
          <th>음식점</th><th>리뷰 제목</th><th>작성 날짜</th>
        </tr>
      </thead>
      <tbody>
       <c:forEach var="review" items="${review}">
	        <tr>
	          <td>${review.store_id}</td>
	          <td>
	          	<a href="${pageContext.request.contextPath}/board/oneReviewId?review_id=${review.review_id}">
	          	${review.review_title}
	          	</a>
	          </td>
	          <td>${review.created_date}</td>
	        </tr>
	     </c:forEach>
      </tbody>
    </table>
</div>
<div >

</div>
</div>
</div>
  
<div class="member-Info-container2" style="margin-top: 30px;">
<div style="margin-top: 20px;">
<h1 class="myPage-margin-size" style="font-size: 40px;">leaved ${memberInfo.nickName}'s feedback</h1>
<hr>
	<div style="overflow: auto; height: 70%">
		<table class="tableHeader" style="width: 100%; text-align: center;'">
	      <thead>
	        <tr>
	          <th>음식점</th><th>카테고리</th><th>등록 날짜</th>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
	      		<td>Lorem</td><td>Ipsum</td><td>Dolor</td>
	        </tr>
	      </tbody>
	    </table>
	  </div>
	<div >
</div>
</div>
</div>    
</div>
</div>
</body>
</html>