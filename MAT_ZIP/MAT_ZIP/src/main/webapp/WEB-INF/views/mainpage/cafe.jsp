<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.mat.zip.mainpage.MzlistVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<!-- 
<link href="/resources/css/style.css" rel="stylesheet" /> -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="resources/images/favicon.png" type="">

<title>Feane</title>

<!-- bootstrap core css -->
<!--   검정색 상단바 메뉴들 노출 관련 css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap.css" />">

<!-- font awesome style -->
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet" />




<!-- Custom styles for this template -->

<!--  카테고리별 음식점 검색의 템플릿 -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
<!-- responsive style -->
<link href="/resources/css/responsive.css">


<link href="/resources/css/mainpage.css" rel="stylesheet">
</head>

<body class="sub_page">

	<div class="hero_area">
		<div class="bg-box">
			<img src="<c:url value="/resources/images/hero-bg.jpg" />" alt="">
		</div>
		<!-- header section strats -->
		<!-- header section strats -->
		<header class="header_section">
			<div class="container">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="index.html"> <span>
							Mat.zip </span>
					</a>

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class=""> </span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav  mx-auto ">
							<li class="nav-item active"><a class="nav-link"
								href="index.jsp">Home </a> <!-- <span class="sr-only">(current)</span> 원래 a태그 안에있던것 --></li>
							<li class="nav-item"><a class="nav-link"
								href="boss/board_index.jsp">사장님 커뮤니티</a></li>

							<li class="nav-item"><a class="nav-link"
								href="board/boardIndex.jsp">회원 커뮤니티</a></li>

						</ul>
						<div class="user_option">
							<g> <g> <path
								d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                   c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
							</g> </g>
							<g> <g> <path
								d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                   C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                   c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                   C457.728,97.71,450.56,86.958,439.296,84.91z" />
							</g> </g>
							<g> <g> <path
								d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
							</g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<g> </g>
							<!--캘린더 들어갈 위치 -->
							<div style="width: 50px; height: 50px;">
								<a href="resources/images/c.png" data-title="오늘의 캘린더"
									data-lightbox="example-set" style="margin: 0px 0px;"> <img
									src="resources/images/cal.png" style="width: 50px">
								</a>
							</div>
							<!-- 로그인했을 시에 마이페이지 버튼 표시 -->
							<div class="client_section">
								<div class="box" style="margin: 10px;">
									<div class="user-img-box">
										<c:if test="${user_id == null}">
											<a href="mz_member/signUp"> <img
												src="resources/images/basic.png" alt="" class="box-img"
												style="width: 50px;">
											</a>
										</c:if>
										<c:if test="${user_id != null}">
											<a href="mz_member/myPage"> <img
												src="resources/images/basic.png" alt="" class="box-img"
												style="width: 50px;">
											</a>
										</c:if>
									</div>
								</div>
							</div>
							<c:if test="${user_id == null}">
								<a href="mz_member/login" class="order_online"> LOGIN </a>
							</c:if>
							<c:if test="${user_id != null}">
								<a href="mz_member/logout" class="order_online"> LOGOUT </a>
							</c:if>
							<span onclick="openNav()" class="user_link"
								style="margin-left: 15px;"> </span>
							<!-- Nav -->
							<div id="myNav" class="overlay" style="width: 0%">
								<a href="javascript:void(0)" class="closebtn"
									onclick="closeNav()">X</a>
								<div class="overlay-content">
									<a href="index.jsp">HOME</a> <a href="mz_member/myPage">ABOUT
										ME</a> <a href="book.jsp">BOOK TABLE</a>
								</div>
							</div>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- end header section -->
		<!-- end header section -->
	</div>

	<!-- --------------------------------------------- -->
<body>

	<!-- book section -->
	<section class="book_section layout_padding">
		<div class="container">
			<div class="heading_container">
				<h1>분식 페이지</h1>
			</div>
			<hr>
			<h2>점검중..</h2>
			<hr>


									<!-- footer section -->
									<footer class="footer_section">
										<div class="container">
											<div class="row">
												<div class="col-md-4 footer-col">
													<div class="footer_contact">
														<h4>Contact Us</h4>
														<div class="contact_link_box">
															<a href=""> <i class="fa fa-map-marker"
																aria-hidden="true"></i> <span> Location </span>
															</a> <a href=""> <i class="fa fa-phone"
																aria-hidden="true"></i> <span> Call +01
																	1234567890 </span>
															</a> <a href=""> <i class="fa fa-envelope"
																aria-hidden="true"></i> <span> demo@gmail.com </span>
															</a>
														</div>
													</div>
												</div>
												<div class="col-md-4 footer-col">
													<div class="footer_detail">
														<a href="" class="footer-logo"> Feane </a>
														<p>Necessary, making this the first true generator on
															the Internet. It uses a dictionary of over 200 Latin
															words, combined with</p>
														<div class="footer_social">
															<a href=""> <i class="fa fa-facebook"
																aria-hidden="true"></i>
															</a> <a href=""> <i class="fa fa-twitter"
																aria-hidden="true"></i>
															</a> <a href=""> <i class="fa fa-linkedin"
																aria-hidden="true"></i>
															</a> <a href=""> <i class="fa fa-instagram"
																aria-hidden="true"></i>
															</a> <a href=""> <i class="fa fa-pinterest"
																aria-hidden="true"></i>
															</a>
														</div>
													</div>
												</div>
												<div class="col-md-4 footer-col">
													<h4>Opening Hours</h4>
													<p>Everyday</p>
													<p>10.00 Am -10.00 Pm</p>
												</div>
											</div>
											<div class="footer-info">
												<p>
													&copy; <span id="displayYear"></span> All Rights Reserved
													By <a href="https://html.design/">Free Html Templates</a><br>
													<br> &copy; <span id="displayYear"></span> Distributed
													By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
												</p>
											</div>
										</div>
									</footer>
									<!-- footer section -->



									<!-- popper js -->
									<script
										src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
										integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
										crossorigin="anonymous">
										
									</script>
									<!-- bootstrap js -->
									<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
									<!-- owl slider -->
									<script
										src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
										
									</script>
									<!-- isotope js -->
									<script
										src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>

									<!-- custom js -->
									<script src="/resources/js/custom.js"></script>
									<!-- Google Map -->
									<script
										src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
										
									</script>
									<!-- End Google Map -->
</body>

</html>