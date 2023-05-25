<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.mat.zip.boss.BoardVO"%>
<%@page import="com.mat.zip.boss.ComVO"%>
<%@page import="com.mat.zip.boss.Boss_memberVO"%>
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
  <link rel="shortcut icon" href="../resources/images/favicon.png" type="">

  <title>Mat.zip </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="../resources/css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="../resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="../resources/css/responsive.css" rel="stylesheet" />
  <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
  <link href="../resources/css/boss.css?ver=1" rel="stylesheet">
  <!-- boss.css 파일을 추가 -->
  <style>@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap'); </style>
</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="../resources/images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section" style="z-index: 100;">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="../index.jsp">
            <span>
              Mat.zip
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
              <li class="nav-item">
                <a class="nav-link" href="../index.jsp">Home </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="menu.html">Menu</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="book.html">Book Table <span class="sr-only">(current)</span> </a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="book.html">사장 커뮤니티 <span class="sr-only">(current)</span> </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="book.html">회원 커뮤니티 <span class="sr-only">(current)</span> </a>
              </li>
            </ul>
            <div class="user_option">
              <a href="" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
              <a class="cart_link" href="#">
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
              </a>
              <form class="form-inline">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </form>
              <a href="" class="order_online">
                Order Online
              </a>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>

  <!-- book section -->
<header class="p-3 text-bg-dark">
<div class="container">
<div class="d-flex flex-wrap align-tiems-center justify-content-center justify-content-lg-start">
<a href="" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
	<svg class="bi-me-2" width="40" height="32" role="img" aria-label="Bootstrap">
		<use xlink:href="#bootstrap"></use>
	</svg>
</a>
<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	<li>
	<a href="board_index.jsp"><button class="btn btn-outline-light me-2">매출차트</button></a>
	</li>
	<li>
	<a href="board_index.jsp"><button class="btn btn-outline-light me-2">또슐랭차트</button></a>
	</li>
	<li>
	<a href="board_index.jsp"><button class="btn btn-outline-light me-2">감정분석차트</button></a>
	</li>
	<li>
	<a href="board_index.jsp"><button class="btn btn-outline-light me-2">자유게시판</button></a>
	</li>
</ul>
		<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
        </form>
        <% if (session.getAttribute("user_id") != null) { %>
        <div class="text-end">
          <button type="button" class="btn btn-outline-light me-2">${nickName}님</button>
         <a href="logout"><button type="button" class="btn btn-warning">Logout</button></a>
        </div>
        <% } else { %>
        <div class="text-end" style="z-index: 200;">
         <a href="boss_login.jsp"><button type="button" class="btn btn-warning">Login</button></a>
        </div>
        <% } %>
</div>
</div>

</header>

	<% if (session.getAttribute("boss_id") != null) { %>
	<br>
	<div class="container">
		<!--컨테이너  -->
		<div class="row" class="col-md-9">
			<!-- 로우설정  -->
			<h3>
				<strong><em><span
						class="badge rounded-pill text-bg-warning">자유게시판</span></em></strong>
			</h3>
		</div>
		<br>
		<div class="row" class="col-md-9">
			<!-- 로우설정  -->
			<h3>
				<strong><em>${bag.title}</em></strong>
			</h3>
		</div>
		<div class="row" class="col-md-9">
			<h5>${bag.writer}</h5>
		</div>
		<div class="row" class="col-md-9">
			<h6>${bag.content}</h6>
		</div>
		
		<div class="row" class="col-md-2">
			<form action="like" method="post" class="like-form">
    <input type="hidden" name="board_id" value="${bag.board_id}">
    <button type="submit" class="like-button" style="background:red; color: white" >좋아요 ${bag.likecount}</button>
</form>
		</div>
		
		<div class="row" class="col-md-2">
			<h6><button type="button" class="btn btn-outline-dark">댓글 개수: ${commentCount}</button></h6>
		</div>
	</div>
	
	<hr color="green">
	<div id="result">
		<div class="container">
			<div class="row">
				<h4>
					<strong>댓글 ${commentCount}</strong>
				</h4>
				<table>
					<c:forEach items="${Com_list}" var="bag">
						<tr>
							<em><span style="border-bottom: 2px solid green;">${bag.writer}<br></span></em>
						</tr>
						<tr>${bag.content}<br>
						</tr>
						<tr>
							<fmt:formatDate value="${bag.regdate}" pattern="yyyy-MM-dd HH:mm" />
					        <!-- 로그인 사용자와 댓글 작성자가 동일한 경우에만 수정 및 삭제 옵션을 렌더링합니다. -->
						        <c:if test="${sessionScope.user_id == bag.writer}">
						            <div class="comment-menu">
						                <span class="menu-icon">&#9776;</span>
						                <div class="menu-options" style="display: none;">
						                    <span class="edit-option">수정</span>
						                    <span class="delete-option">삭제</span>
						                </div>
						            </div>
						        </c:if>

						</tr>	
							<hr>
						
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<!-- 댓글 -->
	<div class="container">
		<% if (session.getAttribute("boss_id") != null) { %>
		<h5 style="color: green;">회원:${nickName}</h5>

		<input id="com">
		<button id="b1" class="btn btn-outline-success">작성</button>
		<br>
		<%-- 		<%  if(comid.equals(comwriter)){}%>
	<h5 style="color: green;" class="id">회원:${id}</h5>

			<input id="com">
			<button id="b1">작성</button>
			<br> --%>

		<% } else { %>로그인시 작성가능
		<% } %>
		<!--댓글끝 -->


		<hr color="green">
		<%
			//세션에서 값을 꺼내는 방법
		String id = (String) session.getAttribute("user_id");
		//모델에서 값을 꺼내는 방법
		//model.addAttribute("bag",bag)
		BoardVO bag = (BoardVO) request.getAttribute("bag");
		String writer = bag.getWriter();
		// 접속중인 id와 writer가 같으면 수정 , 삭제버튼 출력
		if (id != null) {
			if (id.equals(writer)) {
				// 세션값으로 아래 내용4개를 저장해서 넘김
		session.setAttribute("board_id", bag.getBoard_id());
		session.setAttribute("title", bag.getTitle());
		session.setAttribute("content", bag.getContent());
		session.setAttribute("writer", bag.getWriter());
		%>
		<a href="boardUpdate.jsp">
			<button class="btn btn-outline-success">수정</button>
		</a> <a href="boardDelete.jsp">
			<button class="btn btn-outline-success">삭제</button>
		</a>
		
		<%
			}
		}
		%>
	</div>
	<br>

	<div class="container">
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<table class="table"
				style="text-align: center; border: 1px solid #dddddd">
				<tr class="table-success">
					<td><input type="hidden" id></td>
					<div class="col-md-6">
						<td>제목</td>
					</div>
					<div class="col-md-1">
						<td>글쓴이</td>
					</div>
					<div class="col-md-3">
						<td>작성시간</td>
					</div>
					<div class="col-md-1">
						<td>조회수</td>
					</div>
					<div class="col-md-1">
						<td>좋아요</td>
					</div>
				</tr>
				<c:forEach items="${Board_list}" var="bag">
					<tr>
						<td><input type="hidden" ${bag.board_id}></td>
						<td><a href="Board_detail?board_id=${bag.board_id}">${bag.title}</a></td>
						<td>${bag.writer}</td>
						<td><fmt:formatDate value="${bag.regdate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${bag.viewscount}</td>
						<td>${bag.likecount}</td>

					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- <form action="Board_like" method="get">
	<button>좋아요</button>
</form> -->
	<div class="container">
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			
		</div>
	</div>
	<!-- 여기까지가 사장세션 접속시 보이는 리얼값 -->
	
	<%
		} else {
	%>
	<!-- 여기서부터 블러처리 구독결제 유도 -->
	<div class="container blur parent">
		<!-- 블러 클래스를 추가합니다 -->
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<div id="content"></div>
		</div>
	</div>
	<div id="payment-container"></div>
	<div class="overlay" >
		<!-- 오버레이를 추가합니다 -->
		<a href="boss_member.jsp"><button class="subscribe-btn">구독 결제하기</button></a>
	</div>
	
	<div class="container blur">
		<!-- 블러 클래스를 추가합니다 -->
		<!--컨테이너  -->
		<div class="row">
			
		</div>
	</div>
	
	<%
		}
	%>
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

  <!-- jQery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="../resources/js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="../resources/js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->
 <!--  <script src="../resources/js/boss_menu.js?ver=3"></script>
  커뮤니티메뉴 js 파일을 추가  -->
</body>

</html>