<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.mat.zip.mainpage.MzlistVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<title>Mat.zip</title>

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
					<a class="navbar-brand" href="../index.jsp"> <span> Mat.zip
					</span>
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
								href="../boss/board_index.jsp">사장님 커뮤니티</a></li>

							<li class="nav-item"><a class="nav-link"
								href="../board/boardIndex.jsp">회원 커뮤니티</a></li>

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
								<a href="../../resources/images/c.png" data-title="오늘의 캘린더"
									data-lightbox="example-set" style="margin: 0px 0px;"> <img
									src="../../resources/images/cal.png" style="width: 50px">
								</a>
							</div>
							<!-- 로그인했을 시에 마이페이지 버튼 표시 -->
							<div class="client_section">
								<div class="box" style="margin: 10px;">
									<div class="user-img-box">
										<c:if test="${user_id == null}">
											<a href="../mz_member/signUp"> <img
												src="../../resources/images/basic.png" alt="" class="box-img"
												style="width: 50px;">
											</a>
										</c:if>
										<c:if test="${user_id != null}">
											<a href="../mz_member/myPage"> <img
												src="../../resources/images/basic.png" alt="" class="box-img"
												style="width: 50px;">
											</a>
										</c:if>
									</div>
								</div>
							</div>
							<%-- <c:if test="${user_id == null}">
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
							</div> --%>
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
				<h1>맛집 상세페이지</h1>
			</div>


			<hr>
			<span class="title">
				<h1 class="restaurant_name"><<${vo.name}>></h1>
			</span>





			<!-- --------------------------------- -->
			<div>

				<button
					onclick="copyToClipboard('http://localhost:8888/zip/mainpage/mzonee?landNumAddress=' + encodeURIComponent('${vo.landNumAddress}'))">URL
					복사</button>

				<script>
					
					function copyToClipboard(text) {
						
						
						const base_url ='http://localhost:8888/zip/mainpage/'
							const url = encodeURIComponent(window.location.href);
						const url_result = base_url + url;
						
						
						console.log('url', base_url+url)
						
						// 가상의 textarea 엘리먼트를 생성하여 클립보드에 텍스트 복사하는 함수
						var textarea = document.createElement('textarea'); // 가상의 textarea 엘리먼트 생성(선택한 내용을 클립보드로 복사하는 메서드 사용)
						textarea.value = text; // textarea에 복사할 텍스트 설정
						document.body.appendChild(textarea); // textarea를 DOM에 추가
						textarea.select(); // textarea 내용을 선택
						document.execCommand('copy'); // 선택한 내용을 클립보드로 복사하는 메서드 사용
						document.body.removeChild(textarea); // 가상의 textarea를 DOM에서 제거(1회성)

						// 복사 완료 메시지 등을 추가로 처리할 수 있습니다.
						alert('URL이 클립보드에 복사되었습니다.'); // 복사 완료 메시지 표시
					}
					
				</script>


				<button onclick="../../board/boardReview.jsp">후기 및 커뮤니티
					바로가기</button>

			</div>
			<!-- ------------------------------------- -->



			<!--      <div class="box"> -->
			<div class="detail-box" style="position: relative;">
				<div class="img-box"
					style="display: flex; justify-content: center; align-items: center; flex-direction: row;">
					<div class="img-box">

						<%
							// 변수 초기화
						String name = ""; // 이름을 담을 변수
						int no = 0; // 번호를 담을 변수

						// 반복문을 통해 5번 실행
						for (int i = 0; i < 5; i++) {
							// request 객체에서 "vo" 속성을 가져옴
							MzlistVO vo = (MzlistVO) request.getAttribute("vo");

							// vo가 null이 아닌 경우 실행
							if (vo != null) {
								// vo에서 이름과 번호를 가져와 변수에 저장
								name = vo.getName();
								no = vo.getNo();
						%>

						<img src="../resources/img/<%=no + name + i%>.jpg"
							class="img-fluid" alt="음식점 사진 <%=i + 1%>"
							style="margin: 5px; width: 200px; height: 200px;">



						<%
							}
						}
						%>
					</div>
				</div>

			</div>
			<!--  이미지 박스 -->





			<div class="column-wrapper">
				<!-- 데스크탑 컨텐츠 영역 -->
				<div class="column-contents">
					<div class="inner">

						<!-- 레스토랑 상세 -->


						<div>
							<style>
.info {
	width: 70%; /* 원하는 테이블 넓이로 설정 */
}
</style>



							<br> <br> <br> <br>


							<table class="info no_menu">


								<tbody>
									<tr class="only-desktop">
										<th>
											<h1 class="restaurant_name">--------</h1>
										</th>
									</tr>

									<tr class="only-desktop">
										<th>음식 카테고리</th>
										<td>${vo.food}</td>
									</tr>

									<tr class="only-desktop">
										<th>도로명주소</th>
										<td>${vo.roadNameAddress}</td>
									</tr>

									<tr class="only-desktop">
										<th>지번주소</th>
										<td>${vo.landNumAddress}</td>
									</tr>


									<tr class="only-desktop">
										<th>영업상태</th>
										<td>${vo.status}</td>
									</tr>


									<tr>
										<th>전화번호</th>
										<td>${vo.tel}</td>
									</tr>

									<tr class="only-desktop">
										<th>
											<h1 class="restaurant_name">--------</h1>
										</th>
									</tr>

								</tbody>

							</table>

							<br> <br>





							<!-- -----------------포털 검색으로 매장의 정보 확인하기------------------ -->

							<div class="heading_container">
								<h4>네이버 지도로 매장 정보 확인</h4>

								<button
									onclick="searchOnNaverMaps('${vo.name}', '${vo.landNumAddress}', '${vo.roadNameAddress}')">네이버
									지도</button>

								<script>
									function searchOnNaverMaps(name,
											landAddress, roadAddress) {
										// 검색어와 주소를 URL 인코딩하여 파라미터로 전달하는 함수
										var encodedName = encodeURIComponent(name);
										var encodedLandAddress = encodeURIComponent(landAddress);
										var encodedRoadAddress = encodeURIComponent(roadAddress);

										// 네이버 길찾기 URL
										var naverMapsURL = 'https://map.naver.com/?query='
												+ encodedName;

										// 지번주소와 도로명주소가 일치하는 경우 해당 주소를 추가로 전달
										if (landAddress !== '') {
											naverMapsURL += '&sm=hty&searchCoordType=1&sx='
													+ encodedLandAddress;
										} else if (roadAddress !== '') {
											naverMapsURL += '&sm=hty&searchCoordType=2&sx='
													+ encodedRoadAddress;
										}

										// URL로 페이지 이동
										location.href = naverMapsURL;
									}
								</script>

							</div>

						</div>

						<hr>
						<br>


						<!-- -----------------포털 검색으로 매장의 정보 확인하기 끝------------------ -->






						<div class="heading_container">
							<h2>주변 카페, 음식점 더보기</h2>
							<br>

							<title>카테고리별 장소 검색하기</title>
							<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}
/* #category li .store {background-position: -10px -180px;} */
#category li .food {
	background-position: -10px -216px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
</style>
							</head>
							<body>
								<div class="map_wrap">
									<div id="map"
										style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
									<ul id="category">
										<!-- <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            은행
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            마트
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            약국
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            주유소
        </li>   -->
										<li id="CE7" data-order="4"><span
											class="category_bg cafe"></span> 카페 <!-- </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li>      --> <!-- bank 이미지를 썼지만 음식점이라고 부르기로 함 -->
										<li id="FD6" data-order="0"><span
											class="category_bg bank"></span> 음식점</li>
									</ul>
								</div>

								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	77203b0d278b8fd803304a030e6d4c61&libraries=services"></script>
								<script>
									// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
									var placeOverlay = new kakao.maps.CustomOverlay(
											{
												zIndex : 1
											}), contentNode = document
											.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
									markers = [], // 마커를 담을 배열입니다
									currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new kakao.maps.LatLng(
												37.566826, 126.9786567), // 지도의 중심좌표
										level : 5
									// 지도의 확대 레벨
									};

									//지도의 크기를 설정합니다
									mapContainer.style.width = '1000px'; // 원하는 가로 크기
									mapContainer.style.height = '500px'; // 원하는 세로 크기

									// 지도를 생성합니다    
									var map = new kakao.maps.Map(mapContainer,
											mapOption);

									//주소를 좌표로 변환하여 지도 위에 마커 표시
									//주소-좌표 변환 객체를 생성합니다
									var geocoder = new kakao.maps.services.Geocoder();

									var address; // 주소 변수 선언

									if ('${vo.landNumAddress}') {
										address = '${vo.landNumAddress}';
									} else if ('${vo.roadNameAddress}') {
										address = '${vo.roadNameAddress}';
									} else {
										address = ''; // 두 주소 모두 없을 경우 빈 문자열로 설정
									}

									if ('${vo.landNumAddress}'
											|| '${vo.roadNameAddress}') {

										//주소로 좌표를 검색합니다
										geocoder
												.addressSearch(
														address,
														function(result, status) {

															// 정상적으로 검색이 완료됐으면 
															if (status === kakao.maps.services.Status.OK) {

																var coords = new kakao.maps.LatLng(
																		result[0].y,
																		result[0].x);

																// 결과값으로 받은 위치를 마커로 표시합니다
																var marker = new kakao.maps.Marker(
																		{
																			map : map,
																			position : coords
																		});

																// 인포윈도우로 장소에 대한 설명을 표시합니다
																var infowindow = new kakao.maps.InfoWindow(
																		{
																			content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
																		});
																infowindow
																		.open(
																				map,
																				marker);

																// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																map
																		.setCenter(coords);
															}
														})
									};

									// 장소 검색 객체를 생성합니다
									var ps = new kakao.maps.services.Places(map);

									// 지도에 idle 이벤트를 등록합니다
									kakao.maps.event.addListener(map, 'idle',
											searchPlaces);

									// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
									contentNode.className = 'placeinfo_wrap';

									// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
									// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
									addEventHandle(contentNode, 'mousedown',
											kakao.maps.event.preventMap);
									addEventHandle(contentNode, 'touchstart',
											kakao.maps.event.preventMap);

									// 커스텀 오버레이 컨텐츠를 설정합니다
									placeOverlay.setContent(contentNode);

									// 각 카테고리에 클릭 이벤트를 등록합니다
									addCategoryClickEvent();

									// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
									function addEventHandle(target, type,
											callback) {
										if (target.addEventListener) {
											target.addEventListener(type,
													callback);
										} else {
											target.attachEvent('on' + type,
													callback);
										}
									}

									// 카테고리 검색을 요청하는 함수입니다
									function searchPlaces() {
										if (!currCategory) {
											return;
										}

										// 커스텀 오버레이를 숨깁니다 
										placeOverlay.setMap(null);

										// 지도에 표시되고 있는 마커를 제거합니다
										removeMarker();

										ps.categorySearch(currCategory,
												placesSearchCB, {
													useMapBounds : true
												});
									}

									// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
									function placesSearchCB(data, status,
											pagination) {
										if (status === kakao.maps.services.Status.OK) {

											// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
											displayPlaces(data);
										} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
											// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

										} else if (status === kakao.maps.services.Status.ERROR) {
											// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

										}
									}

									// 지도에 마커를 표출하는 함수입니다
									function displayPlaces(places) {

										// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
										// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
										var order = document.getElementById(
												currCategory).getAttribute(
												'data-order');

										for (var i = 0; i < places.length; i++) {

											// 마커를 생성하고 지도에 표시합니다
											var marker = addMarker(
													new kakao.maps.LatLng(
															places[i].y,
															places[i].x), order);

											// 마커와 검색결과 항목을 클릭 했을 때
											// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
											(function(marker, place) {
												kakao.maps.event
														.addListener(
																marker,
																'click',
																function() {
																	displayPlaceInfo(place);
																});
											})(marker, places[i]);
										}
									}

									// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
									function addMarker(position, order) {
										var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
										imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
										imgOptions = {
											spriteSize : new kakao.maps.Size(
													72, 208), // 스프라이트 이미지의 크기
											spriteOrigin : new kakao.maps.Point(
													46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
											offset : new kakao.maps.Point(11,
													28)
										// 마커 좌표에 일치시킬 이미지 내에서의 좌표
										}, markerImage = new kakao.maps.MarkerImage(
												imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker(
												{
													position : position, // 마커의 위치
													image : markerImage
												});

										marker.setMap(map); // 지도 위에 마커를 표출합니다
										markers.push(marker); // 배열에 생성된 마커를 추가합니다

										return marker;
									}

									// 지도 위에 표시되고 있는 마커를 모두 제거합니다
									function removeMarker() {
										for (var i = 0; i < markers.length; i++) {
											markers[i].setMap(null);
										}
										markers = [];
									}

									// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
									function displayPlaceInfo(place) {
										var content = '<div class="placeinfo">'
												+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
												+ place.place_name + '</a>';

										if (place.road_address_name) {
											content += '    <span title="' + place.road_address_name + '">'
													+ place.road_address_name
													+ '</span>'
													+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
													+ place.address_name
													+ ')</span>';
										} else {
											content += '    <span title="' + place.address_name + '">'
													+ place.address_name
													+ '</span>';
										}

										content += '    <span class="tel">'
												+ place.phone + '</span>'
												+ '</div>'
												+ '<div class="after"></div>';

										contentNode.innerHTML = content;
										placeOverlay
												.setPosition(new kakao.maps.LatLng(
														place.y, place.x));
										placeOverlay.setMap(map);
									}

									// 각 카테고리에 클릭 이벤트를 등록합니다
									function addCategoryClickEvent() {
										var category = document
												.getElementById('category'), children = category.children;

										for (var i = 0; i < children.length; i++) {
											children[i].onclick = onClickCategory;
										}
									}

									// 카테고리를 클릭했을 때 호출되는 함수입니다
									function onClickCategory() {
										var id = this.id, className = this.className;

										placeOverlay.setMap(null);

										if (className === 'on') {
											currCategory = '';
											changeCategoryClass();
											removeMarker();
										} else {
											currCategory = id;
											changeCategoryClass(this);
											searchPlaces();
										}
									}

									// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
									function changeCategoryClass(el) {
										var category = document
												.getElementById('category'), children = category.children, i;

										for (i = 0; i < children.length; i++) {
											children[i].className = '';
										}

										if (el) {
											el.className = 'on';
										}
									}
								</script>
						</div>
					</div>
				</div>
	</section>
	<br>
	<br>
	<br>
	<br>









	<!--  카테고리별 음식점 검색   ----------------------------------------------------------------------- -->

	<section>

		<style>
.img-box {
	width: 150%;
	height: 150px; /* 예시로 높이를 300px로 설정 */
}
</style>




		<div class="container">
			<div class="heading_container">

				<h2>카테고리별 음식점 검색</h2>

				<br> <br>
			</div>

			<!-- offer section -->

			<section class="offer_section layout_padding-bottom"
				style="padding-top: 0;">
				<div class="list-container margin-control" style="width: 1200px;">
					<div class="offer_container  rank-location">

						<div class="row" style="line-height: 100%">






							<!--   카테고리별 음식점 검색 -->
							<div class="col-md-6 rank-location">
								<div class="box">
									<div class="detail-box" style="position: relative;">
										<div class="img-box">

											<a href="han.mz?food=한식"> <img
												src="<c:url value="/resources/img/100향촌면옥3.jpg" />"
												alt="랭킹 이미지"
												style="width: 150%; height: 100; object-fit: fill; position: relative;">
											</a>



											<div class="ranking-text"
												style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -20%);">
												<span class="title"
													style="display: inline-block; vertical-align: middle;">한식</span>
												<br> <br>
												<p style="display: inline-block; vertical-align: middle;">한식
													어때요?</p>
											</div>
										</div>



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
									</div>
								</div>
							</div>
							<div class="col-md-6  rank-location">
								<div class="box ">
									<div class="detail-box" style="position: relative;">
										<div class="img-box">

											<a href="jjung.mz?food=중국식"> <!--zip/webapp/resources/images/o2.jpg  -->
												<img src="<c:url value="/resources/img/124송원3.jpg" />"
												alt="랭킹 이미지"
												style="width: 150%; height: 100%; object-fit: fill; position: relative;">
											</a>
											<div class="ranking-text"
												style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -20%);">
												<span class="title"
													style="display: inline-block; vertical-align: middle;">중국식</span>
												<br> <br>
												<p style="display: inline-block; vertical-align: middle;">중국식
													어때요?</p>
											</div>
										</div>
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
									</div>
								</div>
							</div>
							<div class="col-md-6  rank-location">
								<div class="box ">
									<div class="detail-box" style="position: relative;">
										<div class="img-box">
											<a href="ill.mz?food=일식"> <img
												src="<c:url value="/resources/img/6271별난횟집2.jpg" />"
												alt="랭킹 이미지"
												style="width: 150%; height: 100%; object-fit: fill; position: relative;">
											</a>
											<div class="ranking-text"
												style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -20%);">
												<span class="title"
													style="display: inline-block; vertical-align: middle;">일식</span>
												<br> <br>
												<p style="display: inline-block; vertical-align: middle;">일식
													어때요?</p>
											</div>


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
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



					<br> <br>


					<!-- 카테고리별 음식점 검색(3개 더 추가) -->
					<section class="offer_section layout_padding-bottom"
						style="padding-top: 0;">
						<div class="list-container margin-control" style="width: 1200px;">
							<div class="offer_container  rank-location">

								<div class="row" style="line-height: 100%">

									<!--   카테고리별 음식점 검색 -->
									<div class="col-md-6 rank-location">
										<div class="box">
											<div class="detail-box" style="position: relative;">
												<div class="img-box">
													<a href="gyung.mz?food=경양식"> <img
														src="<c:url value="/resources/img/14926미다래2.jpg" />"
														alt="랭킹 이미지"
														style="width: 150%; height: 100%; object-fit: fill; position: relative;">
													</a>
													<div class="ranking-text"
														style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -20%);">
														<span class="title"
															style="display: inline-block; vertical-align: middle;">경양식</span>
														<br> <br>
														<p style="display: inline-block; vertical-align: middle;">경양식
															어때요?</p>
													</div>
												</div>

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
											</div>
										</div>
									</div>
									<div class="col-md-6  rank-location">
										<div class="box ">
											<div class="detail-box" style="position: relative;">
												<div class="img-box">
													<a href="boon.mz?food=분식"> <img
														src="<c:url value="/resources/img/28261생강김밥1.jpg" />"
														alt="랭킹 이미지"
														style="width: 150%; height: 100%; object-fit: fill; position: relative;">
													</a>
													<div class="ranking-text"
														style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -20%);">
														<span class="title"
															style="display: inline-block; vertical-align: middle;">분식</span>
														<br> <br>
														<p style="display: inline-block; vertical-align: middle;">분식
															어때요?</p>
													</div>
												</div>
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
											</div>
										</div>
									</div>
									<div class="col-md-6  rank-location">
										<div class="box ">
											<div class="detail-box" style="position: relative;">
												<div class="img-box">
													<a href="cafe.jsp"> <img
														src="<c:url value="/resources/img/카페.jpg" />" alt="랭킹 이미지"
														style="width: 150%; height: 100%; object-fit: fill; position: relative;">
													</a>
													<div class="ranking-text"
														style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -20%);">
														<span class="title"
															style="display: inline-block; vertical-align: middle;">카페</span>
														<br> <br>
														<p style="display: inline-block; vertical-align: middle;">카페
															어때요?</p>
													</div>
												</div>
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
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>




					</section>



					<!-- 카테고리별 음식점 검색 끝 -->








					<!-- end book section -->

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
											</a> <a href=""> <i class="fa fa-phone" aria-hidden="true"></i>
												<span> Call +01 1234567890 </span>
											</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i>
												<span> demo@gmail.com </span>
											</a>
										</div>
									</div>
								</div>
								<div class="col-md-4 footer-col">
									<div class="footer_detail">
										<a href="" class="footer-logo"> Feane </a>
										<p>Necessary, making this the first true generator on the
											Internet. It uses a dictionary of over 200 Latin words,
											combined with</p>
										<div class="footer_social">
											<a href=""> <i class="fa fa-facebook" aria-hidden="true"></i>
											</a> <a href=""> <i class="fa fa-twitter" aria-hidden="true"></i>
											</a> <a href=""> <i class="fa fa-linkedin" aria-hidden="true"></i>
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
									&copy; <span id="displayYear"></span> All Rights Reserved By <a
										href="https://html.design/">Free Html Templates</a><br> <br>
									&copy; <span id="displayYear"></span> Distributed By <a
										href="https://themewagon.com/" target="_blank">ThemeWagon</a>
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