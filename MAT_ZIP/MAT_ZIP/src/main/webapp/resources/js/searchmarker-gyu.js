	//현위치 가져오기. 좌표로
	var lat;
	var lon;
	var markers = [];
	//현 위치 기반 
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
		
	
	
	$(function () { // 화면 로딩 후 시작
	    $("#searchInput").autocomplete({
		        source: function (request, response) {
		        	$.ajax({
		                url: "registerAndSearch/controller/autoComplete2.mz",
		                dataType: "json",
		                data: {
		                    term: request.term
		                },
		                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		                success: function(data) {
		                	console.log(data);
		                    response(data);
		                }
		            });
		        },
		        focus: function (event, ui) {
		            return false;
		        },
		        minLength: 1,
		        delay: 50
		    });
	
		$("#getSearchResult").click(function() {
	    	$.ajax({
				url : "registerAndSearch/controller/searchResultMarker.mz",
				dataType : "json",
				success : function(json) {
					document.getElementById("map").innerHTML = "";
					var inputValue = $("#searchInput").val();
					console.log(inputValue);
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				    mapOption = { 
						//기본 멀티캠퍼스 좌표 
				        center: new kakao.maps.LatLng(37.4967, 127.0630), // 지도의 중심좌표 // 코드 합치면 바로 쓸 수 있는 lat lon
				        level: 3 // 지도의 확대 레벨
				    };

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					var openInfowindow = null;
					
					// 반복문 map으로 수정 가능할 것 같슴..
					
					// input value를 포함하고 있는 name 배열의 요소들의 짝인 주소들을 바꿔주면 된다. 
					
					var matchedItems = json.filter(function(item) {
	                      return item.name.includes(inputValue) || item.food.includes(inputValue) ;
	                    });
	                
					var matchedNames = matchedItems.map(function(item) {
	                      return item.name;
	                    });
	                var matchedAddresses = matchedItems.map(function(item) {
	                	console.log(item.landNumAddress);
	                	  return item.landNumAddress;
	                	});
					
					
	                var geocoder = new kakao.maps.services.Geocoder();
					
					
	                if(matchedAddresses.length == 1){
	                	var address = matchedAddresses[0];
	                	var name = matchedNames[0];
	                	
	                	geocoder.addressSearch(address, function(result, status) {
						    // if the search was successful
						    if (status === kakao.maps.services.Status.OK) {
						      // Save coordinate values
						      
						      
						      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								
						      addMarker(coords,name,address);  
						        
						      
						      map.setCenter(new kakao.maps.LatLng(result[0].y, result[0].x));
						      
						    }
						});
	                	
	                }else if(matchedAddresses.length > 1){
	                	for (var i = 0; i < matchedAddresses.length; i++) {
							var address = matchedAddresses[i];
							var name = matchedNames[i];
							
							geocodeAddress(address, name);          
				        }
	                	//한국 강남 중심좌표 
	                	map.setCenter(new kakao.maps.LatLng(37.4967,127.0630));
	                	map.setLevel(8);
	                }
	                
	                function geocodeAddress(address, name) {
	                    var geocoder = new kakao.maps.services.Geocoder();
	
	                    geocoder.addressSearch(address, function(result, status) {
	                        // 정상적으로 검색이 완료됐으면
	                        if (status === kakao.maps.services.Status.OK) {
	                            // 좌표값 저장
	                            addMarker(new kakao.maps.LatLng(result[0].y, result[0].x), name , address);
	                        }
	                    });
	                }
	                
	                
					
					function addMarker(position, name , address) {
	
	                    // 마커를 생성합니다
	                    var marker = new kakao.maps.Marker({
	                        position: position,
	                        clickable: true
	                    });
	
	                    // 마커가 지도 위에 표시되도록 설정합니다
	                    marker.setMap(map);
	
	                    // 클로저를 사용하여 인포윈도우 생성
	                    (function(marker, name) {
	                        // 마커에 클릭 이벤트를 등록합니다
	                        kakao.maps.event.addListener(marker, 'click', function() {
	                            // 이전에 열려있던 인포윈도우가 있으면 닫기
	                            if (openInfowindow) {
	                                openInfowindow.close();
	                            }
	
	                            // 새로운 인포윈도우 생성 및 열기
	                            var infowindow = new kakao.maps.InfoWindow({
						          content: '<div style="width:150px;text-align:center;padding:6px 0;"><span style="color: black;">'+name+'</span><br>'+
						          	'<a href="mainpage/mzonee?landNumAddress='+address+'">가게 정보 보러가기</a></div>',
					              removable: true
	                            });
	                            infowindow.open(map, marker);
	
	                            // 열린 인포윈도우를 저장
	                            openInfowindow = infowindow;
	                        });
	                    })(marker, name);
	                }
					
					
				} //success
			}) //ajax
		})//b2 
		
	
	});
	
		
		
	$(function() {
	    // 현재 위치 기반으로 찍힌 마커 보여주기.
	    $('#b2').click(function() {
	        $.ajax({
	            url: "registerAndSearch/controller/Remap.mz",
	            dataType: "json",
	            success: function(json) {
	                document.getElementById("map").innerHTML = "";
	
	                var mapContainer = document.getElementById('map'); // 지도를 표시할 div
	                var mapOption = {
	                    center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
	                    level: 3 // 지도의 확대 레벨
	                };
	
	                var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	                var openInfowindow = null; // 현재 열려있는 인포윈도우를 저장하기 위한 변수
	
	                for (var i = 0; i < json.length; i++) {
	                    var obj = json[i];
	                    // Access the properties of the object
	                    var name = obj.name;
	                    var address = obj.landNumAddress;
	
	                    geocodeAddress(address, name); // 주소를 좌표로 변환하고 마커를 추가하는 함수 호출
	                }
	
	                function geocodeAddress(address, name) {
	                    var geocoder = new kakao.maps.services.Geocoder();
	
	                    geocoder.addressSearch(address, function(result, status) {
	                        // 정상적으로 검색이 완료됐으면
	                        if (status === kakao.maps.services.Status.OK) {
	                            // 좌표값 저장
	                            addMarker(new kakao.maps.LatLng(result[0].y, result[0].x), name , address);
	                        }
	                    });
	                }
	
	                function addMarker(position, name , address) {
	
	                    // 마커를 생성합니다
	                    var marker = new kakao.maps.Marker({
	                        position: position,
	                        clickable: true
	                    });
	
	                    // 마커가 지도 위에 표시되도록 설정합니다
	                    marker.setMap(map);
	
	                    // 클로저를 사용하여 인포윈도우 생성
	                    (function(marker, name) {
	                        // 마커에 클릭 이벤트를 등록합니다
	                        kakao.maps.event.addListener(marker, 'click', function() {
	                            // 이전에 열려있던 인포윈도우가 있으면 닫기
	                            if (openInfowindow) {
	                                openInfowindow.close();
	                            }
	
	                            // 새로운 인포윈도우 생성 및 열기
	                            var infowindow = new kakao.maps.InfoWindow({
						          content: '<div style="width:150px;text-align:center;padding:6px 0;"><span style="color: black;">'+name+'</span><br>'+
						          	'<a href="mainpage/mzonee?landNumAddress='+address+'">가게 정보 보러가기</a></div>',
					              removable: true
	                            });
	                            infowindow.open(map, marker);
	
	                            // 열린 인포윈도우를 저장
	                            openInfowindow = infowindow;
	                        });
	                    })(marker, name);
	                }
	
	            } //success
	        }) //ajax
	    }) //b2
	})

	
	
	let file_selected = ''; 
	
	
	
	function DropFile(dropAreaId, fileListId) {
  	  let dropArea = document.getElementById(dropAreaId);
  	  let fileList = document.getElementById(fileListId);

  	  function preventDefaults(e) {
  	    e.preventDefault();
  	    e.stopPropagation();
  	  }

  	  function highlight(e) {
  	    preventDefaults(e);
  	    dropArea.classList.add("highlight");
  	  }

  	  function unhighlight(e) {
  	    preventDefaults(e);
  	    dropArea.classList.remove("highlight");
  	  }

  	  function handleDrop(e) {
  	    unhighlight(e);
  	    let dt = e.dataTransfer;
  	    let files = dt.files;

  	    handleFiles(files);

  	    const fileList = document.getElementById(fileListId);
  	    if (fileList) {
  	      fileList.scrollTo({ top: fileList.scrollHeight });
  	    }
  	  }

  	  function handleFiles(files) {
  	    files = [...files];
  	    //생겨난 것.
  	    files.forEach(uploadFile_tmp);
  	    files.forEach(previewFile);
  	  }
  	  
	  function uploadFile_tmp(file){
	  		file_selected = file;
	  		/* console.log(file_selected); */
	  } 
  	  
	  //이슈처리 변수 
	  var submitButton = document.querySelector("button");
	  var clickInProgress = false;
  	  function uploadFile() {
  		  //등록 버튼을 빠르게 누르면 처리를 계속 하는 이슈 발생
  		  //이 방식을 통해 클릭 딜레이를 걸어 이슈 처리 
  		  if (clickInProgress) {
  		    return; // If a click event is already in progress, exit the function
  		  }

  		  clickInProgress = true;
  		  submitButton.disabled = true;

  		  setTimeout(function () {
  		    submitButton.disabled = false;
  		    clickInProgress = false;
  		  }, 3000);
		 /* 이슈 처리 끝 */
  		  
  		  const formData = new FormData();
  		  formData.append('uploadFile', file_selected);

  		  $.ajax({
  		    url: 'registerAndSearch/controller/register',
  		    type: 'POST',
  		    data: formData,
  		    processData: false,
  		    contentType: false,
  		    success: function(json) {
  		    	// 닫히게끔 처리 
  		    	console.log(json)
  		    	modal.style.display = "none";
  		    	
  		    	document.getElementById("map").innerHTML = "";
				
				landNumAddress = json.landNumAddress;
				name = json.name;
				count = json.count;
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				console.log(landNumAddress);
				//주소가 "b" 이거나 "a" 라면 alert 하고 
				if(landNumAddress === "k"){
					alert("등록 되셨습니다!!!!! 지도에 표시되려면 다음번에 한번 더 등록해주세요~");
				} else if (landNumAddress === "a") {
					alert("찍어주신 주소와 일치하는 가게가 없습니다.");
				} else if(landNumAddress === "b") {
					alert("영수증에 나와있는 결제일자 시간이 같습니다. 다른 영수증을 등록해주십시오");
				} else if(landNumAddress === "c"){
					alert("주소 추출이 불가합니다. 개발자에게 문의하세요.");
				} else if(landNumAddress === "x"){
					alert("하루 등록 가능 최대 횟수 5회를 초과하셨습니다! 내일 다시 등록해주세요~");
				} else{
					// 주소로 좌표를 검색합니다
					// 카운트를 통해서 마커의 색깔을 변경해 줄 수 있을 것 
					// 5회 이상인 것에 대해서 마커를 변경할 수 있게 처리하면 될듯 
					alert(count + "번 째 등록하셨습니다~ 감사해용~!")
					geocoder.addressSearch(landNumAddress, function(result, status) {

					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
							//좌표값 저장.
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							
					        
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords,
					            clickable: true
					        });

					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;"><span style="color: black;">'+json.name+'</span><br>'+
						          '<a href="mainpage/mzonee?landNumAddress='+landNumAddress+'">가게 정보 보러가기</a></div>',
					            removable: true
					        });
					        console.log(name);
					        infowindow.open(map, marker);
					        
					        // 마커에 클릭이벤트를 등록합니다
				        	kakao.maps.event.addListener(marker, 'click', function() {
				              // 마커 위에 인포윈도우를 표시합니다
				             	 infowindow.open(map, marker);  
				        	});
					        
							
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					}); 
				}
  		    	
  		    },
  		    error: function(xhr, status, error) {
  		      console.log(error);
  		    }
  		  });
  		}

  	  function previewFile(file) {
  	    renderFile(file);
  	  }

  	  function renderFile(file) {
  	    let reader = new FileReader();
  	    reader.readAsDataURL(file);
  	    reader.onloadend = function () {
  	      let img = dropArea.getElementsByClassName("preview")[0];
  	      img.src = reader.result;
  	      img.style.display = "block";
  	    };
  	  }

  	  dropArea.addEventListener("dragenter", highlight, false);
  	  dropArea.addEventListener("dragover", highlight, false);
  	  dropArea.addEventListener("dragleave", unhighlight, false);
  	  dropArea.addEventListener("drop", handleDrop, false);

  	  return {
  	    handleFiles,
  	  	uploadFile
  	  };
  	}

  	const dropFile = new DropFile("drop-file", "files");

		
		
	
	
	// Get the modal
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementsByTagName("button")[0];

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	function openModal() {
	  modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	function closeModal() {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
