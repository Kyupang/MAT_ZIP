<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<html lang="ko">
<head>
<title>캘린더</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jquery datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- jquery datepicker 끝 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${path}/resources/css/main.css" rel="stylesheet"
	type="text/css">
<script src="${path}/resources/js/board.js"></script>
<script type="text/javaScript" language="javascript"></script>
<script
	src="https://www.lgkids.co.kr/es_all/plugins/jscolor-2.0.5/jscolor.js"></script>
	
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
<style TYPE="text/css">

/* 배경색 */
html {
	background-color: #EFEFEF;
}

body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-size: 10pt;
	color: #747474;
}

th {
	font-size: 9pt;
	color: #000000;
}

select {
	font-size: 9pt;
	color: #747474;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

a:link {
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}

a:visited {
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}

a:active {
	font-size: 9pt;
	color: red;
	text-decoration: none;
}

a:hover {
	font-size: 9pt;
	color: red;
	text-decoration: none;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #0030DB;
}

.sun {
	color: #ED0000;
}

.today_button_div {
	float: right;
}

/* 버튼 */
.buttonstyle {
	border: 1px solid #A0D9E2;
	color: #A0D9E2;
	background-color: white;
	margin-bottom: 7px;
	font-weight: bold;
	border-radius: 5px;
	font-size: 10pt;
	width: 200px;
}

.buttonstyle:hover {
	box-shadow: 0px 15px 20px rgba(131, 131, 131, 0.4);
	transform: translateY(-5px);
	background-color: #A0D9E2;
	color: white;
}

.buttonstyle:focus {
	background-color: #A0D9E2;
	color: white;
	border: 3px solid #c9c9c9;
}

/* 캘린더 사이즈 */
.calendar {
	width: 80%;
	margin: auto;
}

/* 년/월 */
.navigation {
	margin-top: 30px;
	margin-bottom: 5px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

/* 캘린더 꾸미기 */
.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid #A0D9E2;
	margin-bottom: 50px;
	border-collapse: collapse;
}

/* 캘린더 꾸미기 */
.calendar_body .today {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.date {
	margin-bottom: 10px;
}

.sat {
	margin-bottom: 10px;
}

.sun {
	margin-bottom: 10px;
}

/* 캘린더 꾸미기 */
.calendar_body .sat_day {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: white;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #0030DB;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

/* 캘린더 꾸미기 */
.calendar_body .sun_day {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: white;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: #ED0000;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

/* 캘린더 꾸미기 */
.calendar_body .normal_day {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: white;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}

.schdule_add_button {
	float: right;
}
/*
      *   게시판 이동 모달
      */
#mask_board_move {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.normal_move_board_modal {
	display: none;
	position: fixed;
	z-index: 10000;
	left: 25% !important;
	top: 15% !important;
	width: 50% !important;
	height: 60% !important;
	border-radius: 12px !important;
	background-color: white !important;
}

.normal_move_board_modal .top {
	background-color: #A0D9E2;
	width: 100%;
	height: 13%;
	border-radius: 12px 12px 0px 0px;
}

.normal_move_board_modal .top .close {
	float: right;
	cursor: pointer;
	color: white;
	font-size: 25px;
	font-weight: bold;
	padding-top: 5px;
	padding-right: 20px;
}

.normal_move_board_modal .top .subject {
	float: left;
	margin-left: 10px;
	margin-top: 20px;
	font-size: 30px;
	font-weight: bold;
	color: white;
	padding-left: 20px;
}

.normal_move_board_modal .bottom {
	width: 100%;
	height: 15%;
	vertical-align: middle;
}

.normal_move_board_modal .bottom .info {
	padding: 10px 15px 10px 15px;
	text-align: left;
	font-size: 12px;
	color: red;
	margin-left: 50px;
}

.normal_move_board_modal .bottom .contents {
	margin: 20px 50px 20px 50px;
	text-align: center;
}

.normal_move_board_modal .bottom .contents .board_select {
	width: 240px;
	height: 40px;
	font-size: 15px;
}

.normal_move_board_modal ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.normal_move_board_modal ul li {
	text-align: left;
	padding: 5px;
	height: 30px;
}

.normal_move_board_modal ul li .text_subject {
	width: 10%;
	height: 100%;
	float: left;
	font-size: 18px;
	vertical-align: middle;
	margin-top: 3px;
}

.normal_move_board_modal ul li .text_desc {
	height: 25px;
	width: 150%;
	float: left;
	font-size: 12px;
}

.normal_move_board_modal ul li .text_area_desc {
	width: 90%;
	float: left;
}

.normal_move_board_modal ul li .text_type1 {
	height: 100% !important;
	width: 100%;
	border: 1px solid #A0D9E2;
}

.normal_move_board_modal ul li .textarea_type1 {
	width: 100%;
	font-size: 18px;
	border: 1px solid #A0D9E2;
}

.normal_move_board_modal ul .button_li {
	padding-top: 40px;
	width: 100%;
}

.normal_move_board_modal .bottom .contents .board_move_go {
	width: 100% !important;
	height: 40px;
	font-size: 15px;
}

.date_subject {
	margin: 0px;
	margin-bottom: 5px;
	margin-left: 12px;
	font-size: 12px;
	font-weight: bold;
	border: none;
}

.date_subject:hover {
	border: 1px solid #A0D9E2 !important;
	border-radius: 7px;
}

.radio {
	margin-top: 12px;
	border: 1px solid #A0D9E2;
}

.colorbox {
	margin-top: 5px;
	border: 1px solid #A0D9E2;
}

/********************************일정 삭제 관리***************************************/
#mask_board_manage {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.normal_manage_board_modal {
	display: none;
	position: fixed;
	z-index: 10000;
	left: 25% !important;
	top: 15% !important;
	width: 50% !important;
	height: 60% !important;
	border-radius: 12px !important;
	background-color: white !important;
}

.normal_manage_board_modal .top {
	background-color: #A0D9E2;
	width: 100%;
	height: 13%;
	border-radius: 12px 12px 0px 0px;
}

.normal_manage_board_modal .top .close {
	float: right;
	cursor: pointer;
	color: white;
	font-size: 25px;
	font-weight: bold;
	padding-top: 5px;
	padding-right: 20px;
}

.normal_manage_board_modal .top .subject {
	float: left;
	margin-left: 10px;
	margin-top: 20px;
	font-size: 30px;
	font-weight: bold;
	color: white;
	padding-left: 20px;
}

.normal_manage_board_modal .bottom {
	width: 100%;
	height: 15%;
	vertical-align: middle;
}

.normal_manage_board_modal .bottom .info {
	padding: 10px 15px 10px 15px;
	text-align: left;
	font-size: 12px;
	color: red;
	margin-left: 50px;
}

.normal_manage_board_modal .bottom .contents {
	margin: 20px 50px 20px 50px;
	text-align: center;
}

.normal_manage_board_modal .bottom .contents .board_select {
	width: 240px;
	height: 40px;
	font-size: 15px;
}

.normal_manage_board_modal ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.normal_manage_board_modal ul li {
	text-align: left;
	padding: 5px;
	height: 30px;
}

.normal_manage_board_modal ul li .text_subject {
	width: 10%;
	height: 100%;
	float: left;
	font-size: 18px;
	vertical-align: middle;
	margin-top: 3px;
}

.normal_manage_board_modal ul li .text_desc {
	height: 25px;
	width: 90%;
	float: left;
}

.normal_manage_board_modal ul li .text_area_desc {
	width: 90%;
	float: left;
}

.normal_manage_board_modal ul li .text_type1 {
	height: 100% !important;
	width: 100%;
	border: 1px solid #A0D9E2;
}

.normal_manage_board_modal ul li .textarea_type1 {
	width: 100%;
	font-size: 18px;
	border: 1px solid #A0D9E2;
}

.normal_manage_board_modal ul .button_li {
	padding-top: 40px;
	width: 100%;
}

.normal_manage_board_modal .bottom .contents .board_manage_go {
	width: 45% !important;
	height: 40px;
	font-size: 15px;
	margin: 0 auto;
}

.managebutton {
	width: 60%;
	margin: 0 auto;
	display: flex;
}
</style>
<script>
	var idx;
	var num;
	var subject;
	var desc;
	var date;
	var share;
	var mycolor;
</script>
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
          <a class="navbar-brand" href="index.html">
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

	<div class="calendar">
		<div class="today_button_div">
			<button type="button" class="buttonstyle"
				onclick="javascript:location.href='calendar'"
				style="height: 30px; width: 80px;">All List</button>
		</div>

		delete 성공했습니다. <img src="${pageContext.request.contextPath}/resources/images/02.png" alt="이미지">
	</div>


</body>
</html>