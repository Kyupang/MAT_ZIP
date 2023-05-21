<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="resources/images/favicon.png" type="">

  <title> 맛.zip </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="resources/css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="resources/css/responsive.css" rel="stylesheet" />

</head>

<body>

  <div class="hero_area">
    <div class="bg-box">
      <img src="resources/images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
              Mat.zip
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
              <li class="nav-item active">
              	
                <a class="nav-link" href="index.jsp">Home </a><!-- <span class="sr-only">(current)</span> 원래 a태그 안에있던것 -->
              </li>
              <li class="nav-item">
                <a class="nav-link" href="menu.html">Menu</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="book.jsp">Book Table</a>
              </li>
            </ul>
            <div class="user_option">
                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                  <g>
                    <g>
                      <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                   c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                    </g>
                  </g>
                  <g>
                    <g>
                      <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                   C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                   c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                   C457.728,97.71,450.56,86.958,439.296,84.91z" />
                    </g>
                  </g>
                  <g>
                    <g>
                      <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                    </g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                </svg>
          <!-- 로그인했을 시에 마이페이지 버튼 표시 -->
           <div class="client_section">
            <div class="box" style="margin: 10px;">
              <div class="user-img-box">
              	<c:if test="${memberInfo == null}">
              	<a href="mz_member/signUp">
                <img src="resources/images/basic.png" alt="" class="box-img" style="width: 50px;">
              	</a>
				</c:if>
              	<c:if test="${memberInfo != null}">
              	<a href="mz_member/myPage">
                <img src="resources/images/basic.png" alt="" class="box-img" style="width: 50px;">
              	</a>
				</c:if>
              </div>
            </div>
          </div>
            <c:if test="${memberInfo == null}">
	            <a href="mz_member/login" class="order_online">
	              LOGIN
	            </a>
			</c:if>
            <c:if test="${memberInfo != null}">
	            <a href="mz_member/logout" class="order_online">
	              LOGOUT
	            </a>
			</c:if>
            	<span onclick="openNav()" class="user_link" style="margin-left: 15px;">
                	<img src="resources/images/menu.png" alt="" class="box-img" style="width: 50px; background-color:transparent;">
              	</span>
				<!-- Nav -->
				<div id="myNav" class="overlay"style="width: 0%">
						<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">X</a>
					<div class="overlay-content">
						<a href="index.jsp">HOME</a>
						<a href="mz_member/myPage">ABOUT ME</a>
						<a href="book.jsp">BOOK TABLE</a>
					</div>
				</div>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
    <!-- slider section -->
	  <section class="slider_section">
	  <div class="container">
	    <div class="row">
	      <div class="detail-box" style="width: 100%; position: relative;">
	        <!-- 지도 들어갈 위치 -->
	        <div id="map" class="map-div" style="width: 100%; height: 450px;"></div>
	        
	        <!-- 검색창 -->
	        <div id="search-container" style="position: absolute; top: 90%; left: 50%; transform: translate(-50%, -50%); z-index: 1;">
	          <nav class="navbar navbar-light">
	            <div class="container-fluid">
	              <form class="d-flex">
	                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	                <button class="btn btn-outline-warning" type="submit">Search</button>
	              </form>
	            </div>
	          </nav>
	        </div>
	        
	        <div class="btn-box" style="position: absolute; top: 90%; left: 12%; transform: translate(-50%, -50%); z-index: 1;">
	          <a href="" class="btn1">
	            Register "DDO"chelin
	          </a>
	        </div>
	      </div>
	    </div>
	  </div>
  </section>

    <!-- end slider section -->
  </div>

  <!-- offer section -->

  <section class="offer_section layout_padding-bottom" style="padding-top: 0;">
      <div class="list-container margin-control" style="width: 1200px;">
    <div class="offer_container  rank-location">
  
      <div class="row" style="line-height: 100%">
          <div class="col-md-6 rank-location">
          <div class="box">
          <div class="detail-box" style="position: relative;">
          <div class="img-box">
	          <a href="">
	          	<img alt="랭킹 이미지" src="resources/images/o1.jpg" style="width: 100%; position: relative">
	          </a>
       		<div class="ranking-text" style="position: absolute;">
          			<span class="title" >강남 맛집 5곳</span>
	          			<p> 맛슐랭 유저가 자주 찾는 강남 맛집 5곳 </p>
	          		</div>
          </div>
              
                    <g>
                      <g>
                        <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                      </g>
                    </g>
                    <g>
                      <g>
                        <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                      </g>
                    </g>
                    <g>
                      <g>
                        <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                      </g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
		          </div>
                </div>
            </div>
          <div class="col-md-6  rank-location">
            <div class="box ">
              <div class="detail-box" style="position: relative;">
              <div class="img-box">
              	<a>
                <img src="resources/images/o2.jpg" alt="랭킹 이미지" style="width: 100%; position: relative;'">
              	</a>
              	<div class="ranking-text" style="position: absolute;">
          			<span class="title" >여성 선호 맛집 5곳</span>
	          			<p> 맛슐랭 여성 유저가 자주 찾는 맛집 5곳 </p>
	          		</div>
              </div>
                    <g>
                      <g>
                        <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                      </g>
                    </g>
                    <g>
                      <g>
                        <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                      </g>
                    </g>
                    <g>
                      <g>
                        <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                      </g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    </div>
              </div>
            </div>
            <div class="col-md-6  rank-location">
            <div class="box ">
              <div class="detail-box" style="position: relative;">
              <div class="img-box">
              	<a>
                <img src="resources/images/f2.png" alt="랭킹 이미지" style="width: 100%; position: relative;'">
              	</a>
              	<div class="ranking-text" style="position: absolute;">
          			<span class="title" >남성 선호 맛집 5곳</span>
	          			<p> 맛슐랭 남성 유저가 자주 찾는 맛집 5곳 </p>
	          		</div>
              </div>
                    <g>
                      <g>
                        <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                      </g>
                    </g>
                    <g>
                      <g>
                        <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                      </g>
                    </g>
                    <g>
                      <g>
                        <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                      </g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    <g>
                    </g>
                    </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </section>

  <!-- end offer section -->

  <!-- food section -->

  <!-- end food section -->

  <!-- about section -->

  
  <!-- end about section -->

  <!-- end book section -->

  <!-- client section -->

  <section class="client_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center psudo_white_primary mb_45">
        <h2>
          	Front Haters
        </h2>
      </div>
      <div class="carousel-wrap row ">
        <div class="owl-carousel client_owl-carousel">
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
					Hello world
				</p>
                <h6>
                  Kim Gyu Hwan
                </h6>
                <p>
                  Engineer
                </p>
              </div>
              <div class="img-box">
                <img src="resources/images/mungmung.png" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
                </p>
                <h6>
                  Mike Hamell
                </h6>
                <p>
                  magna aliqua
                </p>
              </div>
              <div class="img-box">
                <img src="resources/images/client2.jpg" alt="" class="box-img">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end client section -->

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
              Mat.zip
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

  <!-- jQery -->
  <script src="resources/js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="resources/js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="resources/js/custom.js"></script>
  <!-- Kakao Map -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ab6186bb587538d75199b2dc9588259&libraries=services"></script>
  <script type="text/javascript">
	  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	  mapOption = { 
	      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	      level: 3 // 지도의 확대 레벨
	  };
	
		//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
  
  </script>
  <!-- End Google Map -->
  <!-- Nav Function -->
  <script type="text/javascript">
  	function openNav() {
		document.getElementById("myNav").style.width = "40%";
	}
  	function closeNav() {
		document.getElementById("myNav").style.width = "0%";
	}
  </script>
  <!-- End Nav Function -->
  
  
</body>

</html>