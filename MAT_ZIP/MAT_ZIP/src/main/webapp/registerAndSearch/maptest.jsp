<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- content delivery network  : CDN -->
</head>
<body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ab6186bb587538d75199b2dc9588259&libraries=services"></script>
<script type="text/javascript">
	//현위치 가져오기. 좌표로
	var lat;
	var lon;
	var markers = [];
	
	 if (navigator.geolocation) {
		  navigator.geolocation.getCurrentPosition(showPosition);
		} else {
		  console.log("Geolocation is not supported by this browser.");
		}

		function showPosition(position) {
		  console.log("Latitude: " + position.coords.latitude);
		  lat = position.coords.latitude;
		  console.log("Longitude: " + position.coords.longitude);
		  lon = position.coords.longitude;
		
		  //지도그리기.	
		  var mapContainer = document.getElementById('map');// 지도를 표시할 div 
		  var mapOption = {
		    center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		  };
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		  var map = new kakao.maps.Map(mapContainer, mapOption);
		}	 
	$(function() {
		$('#b1').click(function() {
			$.ajax({
				url : "Regi.mz",
				dataType : "json",
				success : function(json) {
					document.getElementById("map").innerHTML = "";
					
					storeAddress = json.storeAddress
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					//주소가 "b" 이거나 "a" 라면 alert 하고 
					if(storeAddress === "k"){
						alert("등록 되셨습니다!!!!! 지도에 표시되려면 다음번에 한번 더 등록해주세요~");
					} else if (storeAddress === "a") {
						alert("찍어주신 주소와 일치하는 가게가 없습니다.");
					} else if(storeAddress === "b") {
						alert("영수증에 나와있는 결제일자 시간이 같습니다. 다른 영수증을 등록해주십시오");
					} else if(storeAddress === "c"){
						alert("주소 추출이 불가합니다. 개발자에게 문의하세요.");
					} else{
						// 주소로 좌표를 검색합니다
						
						geocoder.addressSearch(storeAddress, function(result, status) {

						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
								//좌표값 저장.
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								
						        
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });

						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">존맛집</div>'
						        });
						        infowindow.open(map, marker);

						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						}); 
					}
					
					
				} //success
			}) //ajax
		})// b1
		
		
		function handleAddressSearchResult(address) {
		       var geocoder = new kakao.maps.services.Geocoder();
	            
	            geocoder.addressSearch(address, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
						//좌표값 저장.
				       var latlng2 = new kakao.maps.LatLng(result[0].y, result[0].x);
				     } 
				});
			return latlng2;
		}
		
		
		
		
		
		//현 위치기반 찍힌 마커 보여주기. 
		$('#b2').click(function() {
			$.ajax({
				url : "Remap.mz",
				dataType : "json",
				success : function(json) {
					document.getElementById("map").innerHTML = "";
					
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				    mapOption = { 
				        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					
					for (var i = 0; i < json.length; i++) {
			            var obj = json[i];
			            // Access the properties of the object
			            var name = obj.name;
			            var address = obj.storeAddress;
			            
			            var geocoder = new kakao.maps.services.Geocoder();
			            
			            geocoder.addressSearch(address, function(result, status) {
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
								//좌표값 저장.
						       addMarker(new kakao.maps.LatLng(result[0].y, result[0].x));
						     } 
						});			            
			        }
					
					function addMarker(position) {
			            
			            // 마커를 생성합니다
			            var marker = new kakao.maps.Marker({
			                position: position,
			                clickable: true
			            });

			            // 마커가 지도 위에 표시되도록 설정합니다
			            marker.setMap(map);
			            
			            var iwContent = '<div style="padding:5px;"><a href="https://map.kakao.com/link/to/Hello World!,'+ marker.getPosition().getLat()+','+ marker.getPosition().getLng()+'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			        	// 인포윈도우를 생성합니다
			        	var infowindow = new kakao.maps.InfoWindow({
			           	 content : iwContent,
			           	 removable : iwRemoveable
			        	});

			       		 // 마커에 클릭이벤트를 등록합니다
			        	kakao.maps.event.addListener(marker, 'click', function() {
			              // 마커 위에 인포윈도우를 표시합니다
			             	 infowindow.open(map, marker);  
			        	});
			            
			            
			            // 생성된 마커를 배열에 추가합니다
			            markers.push(marker);
			        }
					
						
					
				} //success
			}) //ajax
		})//b2
		

		
	})// function	
	
</script>
	
	<button id="b1">맛집 등록 버튼.</button>
	<button id="b2">현위치 기반으로 맛집 표시</button>
	
	<div id="map" style="width:100%;height:350px;"></div>
</body>
</html>