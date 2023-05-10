<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>autocomplete 검색창 구현</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ab6186bb587538d75199b2dc9588259&libraries=services"></script>
	
</head>

<body>
<script>
	
	$(function () { // 화면 로딩 후 시작
	    $("#searchInput").autocomplete({ // 오토 컴플릿 시작
	        source: function (request, response) {
	            $.ajax({
	                url: "autoComplete.mz", // 컨트롤러 URL을 입력하세요.
	                dataType: "json",
	                data: {
	                    term: request.term
	                },
	                success: function(data) {
	                	console.log(data);
	                    var searchTerm = request.term;
	                    var matchedItems = data.filter(function(item) {
	                      return item.name.includes(searchTerm);
	                    });
	                    var matchedNames = matchedItems.map(function(item) {
	                      return item.name;
	                    });
	                    response(matchedNames);
	                  }
	            });
	        },
	        focus: function (event, ui) { // 방향키로 자동완성 단어 선택 가능하게 만들어줌	
	            return false;
	        },
	        minLength: 1, // 최소 글자수
	        delay: 100, // autocomplete 딜레이 시간(ms)
	        // disabled: true, // 자동완성 기능 끄기
	    });
	
		//todo list 검색 버튼을 누르면 지도에 관련 벨류를 포함하는 값의 마커를 찍어준다.
	    $("#getSearchResult").click(function() {
	    	$.ajax({
				url : "",
				dataType : "json",
				success : function(json) {
					document.getElementById("map").innerHTML = "";
					var inputValue = $("#searchInput").val();
					
					
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
		})
	
	});
</script>

	<div>
		<input id="searchInput" style="margin-left: 20px; width: 400px;">
		<button id="getSearchResult">검색</button>
	</div>
	<div id="map" style="width: 100%; height: 350px;"></div>
	
</body>

</html>