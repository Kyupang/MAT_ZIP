<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title> MATZIP </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(function() {
    $('#1').click(function() {
        $.ajax({
            type : 'post',
            url : "${pageContext.request.contextPath}/point/exchange",
            data : {
                id : 1
            },
            success : function(data) {
               alert("요청하신 기프티콘 교환되었습니다.");
            },
            error : function(xhr, status, error) {
            	console.log(error.status, error.statusText, error.responseText);
            	alert("포인트 잔액을 확인해주세요.");
            }
        });
    });
    $('#2').click(function() {
        $.ajax({
            type : 'post',
            url : "${pageContext.request.contextPath}/point/exchange",
            data : {
                id : 2
            },
            success : function(data) {
               alert("요청하신 기프티콘 교환되었습니다.");
            },
            error : function(xhr, status, error) {
            	console.log(error.status, error.statusText, error.responseText);
            	alert("포인트 잔액을 확인해주세요.");
            }
        });
    });
    $('#3').click(function() {
        $.ajax({
            type : 'post',
            url : "${pageContext.request.contextPath}/point/exchange",
            data : {
                id : 3
            },
            success : function(data) {
               alert("요청하신 기프티콘 교환되었습니다.");
            },
            error : function(xhr, status, error) {
            	console.log(error.status, error.statusText, error.responseText);
            	alert("포인트 잔액을 확인해주세요.");
            }
        });
    });
    $('#4').click(function() {
        $.ajax({
            type : 'post',
            url : "${pageContext.request.contextPath}/point/exchange",
            data : {
                id : 4
            },
            success : function(data) {
               alert("요청하신 기프티콘 교환되었습니다.");
            },
            error : function(xhr, status, error) {
            	console.log(error.status, error.statusText, error.responseText);
            	alert("포인트 잔액을 확인해주세요.");
            }
        });
    });
});
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
</head>

<body class="sub_page">
  <div class="hero_area">
    <div class="bg-box">
      <img src="${pageContext.request.contextPath}/resources/images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="/zip/index.jsp">
            <span>
              matzip
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto "></ul>
            <div class="user_option">
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>

  <!-- book section -->
  <section class="book_section layout_padding">
    <div class="container-fluid">
      <div class="heading_container">
        <h2>
          기프티콘 목록
        </h2>
      </div>
      <div class="row">
        <div class="col-md-3">
          <div class="form_container">
          <c:forEach items="${list}" var="bag">
              <div class="btn_box">
                <button id="${bag.id}"  style="width: 50%; height: 100%;">
                  <img src="${pageContext.request.contextPath}/resources/images/gif${bag.id}.jpg" style="width: 100%; height: 100%;">
                  <p style="font-size: 15px; font-weight: bold; color: yellow;">${bag.name}</p>
                  <p style="font-size: 15px; font-weight: bold; color: yellow;">${bag.point}</p>
                </button>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end book section -->

  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <div class="footer_contact">
            <h4>
              Contact Us
            </h4>
            <div class="contact_link_box">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
                  Location
                </span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  Call +01 1234567890
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>
                  demo@gmail.com
                </span>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div class="footer_detail">
            <a href="" class="footer-logo">
              Feane
            </a>
            <p>
              Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
            </p>
            <div class="footer_social">
              <a href="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-pinterest" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <h4>
            Opening Hours
          </h4>
          <p>
            Everyday
          </p>
          <p>
            10.00 Am -10.00 Pm
          </p>
        </div>
      </div>
      <div class="footer-info">
        <p>
          &copy; <span id="displayYear"></span> All Rights Reserved By
          <a href="https://html.design/">Free Html Templates</a><br><br>
          &copy; <span id="displayYear"></span> Distributed By
          <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

</body>

</html>