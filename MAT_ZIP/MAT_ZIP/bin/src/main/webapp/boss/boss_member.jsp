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
<title>boss_memberInsert</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
	/* color: #198754; */
	font-weight: bold;
	font-size: 42px;
	text-transform: uppercase;
	padding: 5px;
	margin-bottom: 20px;
	background: linear-gradient(to right, #1a1a1c, #ceced9);
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
<script src="https://js.tosspayments.com/v1/payment"></script>
<script>
  var clientKey = 'test_ck_Wd46qopOB89oxwWnw2OVZmM75y0v';
  var tossPayments = TossPayments('test_ck_Wd46qopOB89oxwWnw2OVZmM75y0v');
  var isDuplicated = false; // ID 중복 여부를 저장하는 변수
  
  function generateOrderId() {
    // 영문 대소문자, 숫자, 특수문자 (-, _)로 이루어진 문자열
    const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
    
    let orderId = "";
    
    // 길이가 10인 주문 ID 생성
    for (let i = 0; i < 10; i++) {
      // characters 문자열에서 무작위로 문자 선택
      const randomIndex = Math.floor(Math.random() * characters.length);
      // 선택된 문자를 주문 ID에 추가
      orderId += characters.charAt(randomIndex);
    }
    
    return orderId;
  }

  function requestPayment() {
	  var storeId = $("input[name='store_id']").val();
	    // 결제하기 전에 다시 한 번 중복 체크를 합니다.
	    $.ajax({
	      type: "POST",
	      async: false,  // 동기 방식으로 요청을 보냅니다.
	      url: "checkStoreId",
	      data: {storeId: storeId},
	      success: function(response) {
	        if (response == 1) {
	          $("#DupliCheckmessage").text("ID 중복체크를 해주세요");
	          isDuplicated = true;
	        } else {
	          isDuplicated = false;
	        }
	      }
	    });

	    if (isDuplicated) {
	      return;  // 중복된 ID가 있으면 함수를 종료
	    }

    <% if (session.getAttribute("user_id") != null) { %>
        var userId = '<%= session.getAttribute("user_id") %>';
        var orderId = generateOrderId();
        var storeId = $("input[name='store_id']").val();
        sessionStorage.setItem("storeId", storeId);  // storeId 값을 세션에 저장
        console.log("생성된 orderId:", orderId);
        tossPayments.requestPayment('카드', {
            amount: 2900,
            orderId: orderId,
            orderName:'사장님커뮤니티 구독결제',
            customerName: userId,
            successUrl: 'http://localhost:8887/MAT_ZIP/boss/tossSuccess',
            failUrl: 'http://localhost:8887/MAT_ZIP/boss/tossFail'
        });
    <% } else { %>
        // 세션에 user_id가 없는 경우에 대한 처리
        console.log("세션에 user_id가 없습니다.");
        // 적절한 대체 처리 방식을 추가하세요.
    <% } %>
  }

//새로운 함수를 정의하여 중복 체크를 수행합니다.
  function checkDuplication() {
    var storeId = $("input[name='store_id']").val();
    $("#DupliCheckmessage").text("");  // 함수가 실행될때마다 메시지 초기화
    $("#DupliCheckmessageS").text("");  
    $.ajax({
      type: "POST",
      url: "checkStoreId",
      data: {storeId: storeId},
      success: function(response) {
        if (response == 1) {
          $("#DupliCheckmessage").text("중복된 상점ID입니다.");
          isDuplicated = true;
        } else {
          $("#DupliCheckmessageS").text("사용가능한 상점ID입니다.");
          isDuplicated = false;
        }
      }
    });
  }

  $(document).ready(function() {
    $("input[name='store_id']").keyup(function() {
      // 사용자가 키를 입력할때 마다 중복 체크를 수행합니다.(keyup이벤트)
      checkDuplication();
    });
 //중복체크 버튼 keyup만 사용할지 고민중...
    $("#checkDuplicate").click(function() {
      $("#DupliCheckmessage").text("");  // 중복체크 버튼을 누를 때마다 메시지 초기화
      checkDuplication();  // 중복 체크를 수행합니다.
    });

    
    // 클릭 이벤트 핸들러를 추가 -> 결제하고완료하기 버튼
    $("#payment").click(function() {
        requestPayment();
    });
  });
  
</script>

</head>
<body class="text-center">
      
	<div id="container">
		<div id="loginBox">
			
			<div id="loginBoxTitle" >사장님 커뮤니티 구독결제</div>

			<div id="inputBox">
    <div class="form-floating mb-3">
        <input name="store_id" class="form-control" id="floatingInput" placeholder="사용할 상점ID를 입력하세요" style="width: 100%; height: 50px;">
        <label for="floatingInput">사용할 상점ID를 입력해주세요</label>
    </div>
	<button id="checkDuplicate" type="button" class="btn btn-outline-danger" style="width: 100%; height: 50px;">중복체크</button>
    <div class="button-login-box">
        <button type="button" class="btn btn-outline-dark" style="width: 100%; height: 50px;" id="payment">결제하고 완료하기</button>
    </div>
    <div class="button-back-box">
        <button type="button" class="btn btn-secondary" onclick="goBack()" style="width: 100%; height: 50px;">이전 페이지로</button>
    </div>
    <small class="text-muted">상점ID는 차트분석을 위해 사용됩니다.</small>
<p id="Duplimessage" style="color:red"></p>
<p id="DupliCheckmessage" style="color: $red-500; height: 20px; overflow: hidden;"></p>
<p id="DupliCheckmessageS" style="color:green; height: 20px; overflow: hidden;"></p>
<!-- 로그인 실패 메시지를 출력하는 부분 -->
 <div style="color: $red-500;">${msg}</div>
                
			</div>
			
		</div>
	</div>
	
<!-- <div class="row align-items-center g-lg-5 py-5">
      <div class="col-lg-7 text-center text-lg-start">
        <h1 class="display-4 fw-bold lh-1 mb-3">사장님 회원 구독결제 하기</h1>
        <p class="col-lg-10 fs-4">월 2,900원으로 사장님 회원님 등록하고 매출차트, 또슐랭차트, 리뷰감정분석으로 영리하게 가게를 관리하세요. 사장님들만의 커뮤니티도 있습니다.</p>
      </div>
      <div class="col-md-10 mx-auto col-lg-5">
        <form class="p-4 p-md-5 border rounded-3 bg-light">
          <div class="form-floating mb-3">
            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
            <label for="floatingInput">상점ID를 등록하세요</label>
          </div>
          <button class="w-100 btn btn-lg btn-primary" type="submit">결제하고 완료하기</button>
          <hr class="my-4">
          <small class="text-muted">사용할 상점ID는 차트분석을 위해 사용됩니다.</small>
        </form>
      </div>
    </div> -->
</body>
</html>
