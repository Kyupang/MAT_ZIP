# [팀프로젝트] 맛.JAVA - 맛.ZIP
#### 💡 맛.ZIP은 “진짜 믿고 먹을 수 있는 맛집” 을 공유하는 플랫폼입니다.
* 맛.JAVA 팀은 맛집 탐방에 누구보다 진심인 사람들이 뭉친 팀입니다. 🍔
* 평소에 모두가 겪고 있던 부정한 광고, 믿을 수 없는 후기 속에서 소비자들이 믿고 방문할 수 있는 맛집을 모아 볼 수 있는 사이트의 필요성을 느꼈습니다.
* 그래서, 영수증 2회 이상 인증된 맛집만 등록되도록 해서 신뢰도 및 만족도가 높은 맛집만 선별하여 소비자에게 제공하는 목적으로 개발을 진행했습니다.
* 국내 운영 중인 맛집 추천 사이트, 대형 포털 지도 사이트의 사례 분석을 통해, 웹사이트 기능의 방향성을 "진정성 있는 맛집 공유"로 초점을 맞췄습니다.
* 맛집을 좋아하는 사람들 뿐만 아니라, 맛집을 좋아하는 사람들의 방문을 원하는 요식업계 사장님들도 타켓팅한 사장님 전용 구독 서비스 및 노출 배너 광고를 BM으로 설정했습니다.

<br>

## 1. 제작 기간
#### `2023년 4월 28일 ~ 6월 9일 (1개월)`

<br>

## 2. 사용 기술
### `Back-end`
* Java 8
* Spring Framework 5.0.1, Spring MVC
* Junit5
* Maven
* Mybatis
* Eclipse, Visual Studio Code

### `Front-end`
* HTML
* CSS
* JavaScript
* JQuery 3.6.4
* BootStrap 4.1

### `DevOps`
* AWS EC2, S3, RDS, CloudFront, Route 53, ALB
* Tomcat 8.5
* MySQL 8.0.32

### `Collaboration`
* Git, Sourcetree 
* Slack 
* Notion

### `External API`
* Naver OCR
* Naver, Kakao Social Login
* CLOVA Chatbot API
* Naver SENS API
* Naver AI Sentiment
* Toss Payments API
* Google chart API
* Kakao Map 
* Geo Location


<br>

## 3. 기능 구현
* ##### `[정서현] 회원가입, 로그인, 마이페이지, AI챗봇`
  * 이메일 인증, 유효성 검사를 통한 회원가입
  * 일반, 간편 로그인, 임시 비밀번호 발급 가능
  * 챗봇 API를 통해 자주 묻는 질문 등록

* ### `[김규환] 영수증 등록, 검색기능`
  * 영수증, 카드내역을 통한 또 갔던 맛집 등록기능 
  * 2회 이상 등록된 맛집 검색기능
  * AWS 배포 관련 아키텍쳐 설계, 관리 

* ##### `[최윤서] 음식점 상세페이지`
  * 음식점 상세정보 CRUD 기능 및 카테고리별 음식점 검색 기능
  * 상세페이지 URL 복사(for 공유하기)
  * 네이버 포털사이트 이동하여 해당 음식점 검색
  * 카카오 API 사용 ► 해당 음식점의 주소를 받아서 지도 띄우기 + 해당 음식점의 위치를 기반으로 카테고리별 장소 검색

* ##### `[추재영] 회원 커뮤니티`
  * 맛집에 관심이 있는 소비자가 이용하는 커뮤니티로, 리뷰 / 사진 / 지유게시판으로 나누어 유저 용도에 따라 세부 메뉴 분류
  * 각 게시판별 게시물 CRUD 기능 및 댓글 insert 기능
  * 리뷰게시판은 영수증 등록 여부를 체크하여 영수증 등록을 한 유저만 리뷰를 남길 수 있도록 제약사항을 추가하여 리뷰의 신뢰도를 강화함.

* ##### `[이후성] 사장 커뮤니티`
  * 구독 결제 시 사장회원등록, 결제내역 DB 저장
  * 결제내역 DB를 기반으로 데이터 선별하여 매출차트 및 재방문 차트 구현
  * 리뷰 AI 감정분석 차트 - 사용자들이 작성한 리뷰 데이터를 기반으로 AI 감정분석 API를 사용하여 감정분석 결과를 출력
  * 자유게시판 및 좋아요 기능- 게시글 수정, 검색 기능을 강화, '좋아요' 기능을 추가

* ##### `[함영휘] 포인트 시스템, 랭킹 시스템`
  * 영수증 등록 시 포인트 적립
  * 적립된 포인트를 사용해서 상품교환(기프티콘) SENS API 사용해서 문자로 전송
  * 등록된 영수증을 카운트해서 많이 등록된 음식점 카테고리별 분류


<br>

| **회원가입, 로그인, 마이페이지, AI챗봇** | **영수증 등록, 검색기능** |
|:---:|:---:|
| <img src ="https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/23a1ad5b-0408-42e4-918a-c7c7fb7b0934" width="440" height="260" /> | <img src ="https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/14686d48-6457-4f58-8576-043a581f158f" width="440" height="260" /> | 
| **음식점 상세페이지** | **회원 커뮤니티** |
| <img src ="https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/adf1449a-b016-4a5c-874a-8c7839490ca7" width="440" height="260" /> | <img src ="https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/eac545ae-84b0-4d6a-8d25-6ccd41ef3b17" width="440" height="260" /> | 
| **사장 커뮤니티** | **포인트 시스템, 랭킹 시스템** |
| <img src ="https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/97064c73-b97d-417d-9e33-54ca1a7a96b5" width="440" height="260" /> | <img src ="https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/3f370f44-47cb-480a-b433-5e885ff4f00d" width="440" height="260" /> | 


<br>


## 4. ERD 설계
<img src="https://user-images.githubusercontent.com/123634960/242927505-6d8c1885-fd63-41a2-84c7-c521fcce39e7.png">

<br>

## 5. 시스템 아키텍쳐 구성도
![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/0c1d4630-7673-4fc7-b995-e81dea7d1af6)

<details>
  <summary>아키텍쳐 설명 열어보기!</summary>

<br>
	
  ### `아키텍쳐 설계에 대한 정리`
* 📌 담당자 : 김규환 
* 📌 https://docs.google.com/presentation/d/1ctdr4CTAJIyls9e24kb9k101kQK0VD6m/edit?usp=sharing&ouid=104520414346845957015&rtpof=true&sd=true
* 📌 처음 배포를 하는 과정에서 많은 어려움과 난관에 봉착하였었지만 하나하나 해결해 나가며 AWS 아키텍쳐에 대한 이해가 높아졌습니다. 관련 세부사항은 27~28페이지부터 확인하실 수 있습니다.
* **현재 https:://도메인. 으로 배포상태에 있으며, 사진 등록은 로그인 후에 이용하실 수 있습니다.**
	
**📌 필독 : 기본적으로 저희 프로젝트의 가용 범위는 강남 지역으로 한정하였습니다. 영수증에 나와있는 주소가 공공데이터포털의 서울시 강남구 일반 음식점 인허가 정보에 있는 가게의 주소를 기반으로 동작합니다.**
**테스트를 위한 아이디, 비밀번호 그리고 영수증을 첨부할 예정이지만, 실제 서비스와 동일한 환경을 제공하기 위해 같은 영수증은 두 번 이상 등록하지 못하게 구현해 놓았습니다.** 
**또한 같은 영수증을 다중으로 등록하는 것도 악용 사례에 해당하기 때문에 관련 데이터의 유효성 문제는 vkdls754@gmail.com 으로 연락 주시면 친절히 답변 드리겠습니다.**


  #### `용어`
  * 라우트53 : dns 도메인을 관리해주고 아이피로 변환해줍니다.
  * 클라우드 프론트 : cdn , cache에 이점이 있습니다.(정적웹, 동적웹을 분리해주길 위한 역할)
  * 인터넷 게이트웨이 :VPC와 인터넷 간의 통신을 가능하게 하며, 퍼블릭 서브넷의 리소스들이 인터넷에 직접 연결될 수 있도록 합니다.
  * NAT 게이트웨이 : 개인 서브넷의 리소스들이 인터넷과 통신할 수 있도록 하는데, 주로 아웃바운드 트래픽에 사용됩니다.
  * ALB(로드밸런서) : 부하를 분배해줍니다.
  * Bastion : private subnet 에 직접 접근을 할 수 없는데 이를 통해 접속할 수 있게끔 해줍니다.
  
  #### `작동 순서`
  * 클라이언트가 라우트 53 dns 서버를 거쳐 클라우드 프론트로 가게되면 클라우드 프론트에서는 도메인을 확인 후 인터넷게이트를 통해 로드밸런서에 접근하게 됩니다. 
  * 요청한 페이지를 넷게이트웨이에서 공인아이피를 사설아이피로 변환 후 서브넷에 있는 인스턴스와 rds를 통해 가지고 오게 되는데
  * 이때 요청페이지의 헤더에 (우리 페이지의 예시 index.jsp) html, css , 이미지 등이 클라우드 프론트는 S3를 호출하게 되고 데이터를 가져오게 됩니다.
  * 따라서 (도메인은 cdn.matjavamatzip.click으로 설정후 각각의 cdn 호출 부분에 a태그, link를 바꿔줘야 합니다.) 이 파일들은 S3에 저장되게 됩니다.
  * 나머지 동적 웹 데이터들은 순방향으로 인스턴스와 rds를 거쳐 다시 로드밸런서로 돌아오고 클라이언트로 응답을 해줍니다.	

   #### `최종 설계, Next step`
  * 부하 테스트에 따른 Scale Out과 보안을 위한 네트워크 분리는 반드시 이루어져야할 사항입니다.
    현재 설계된 아키텍쳐에서는 몇가지 문제사항이 있습니다.

  ![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/c77c39bc-cb13-4a0b-82b1-9b9b9689fe9f)
  * 서버가 뻗었을 때에 대책방안이 필요합니다. 로드밸런서로 부하를 분배하며, RDS failover 기능을 이용한 slave DB의 master 승격이 이루어져야합니다. 
            부하테스트는 많은 툴이 있겠지만 ngrinder를 이용합니다. aws t3.micro 등은 부하테스트를 조금만 진행해도 서버가 죽을 것입니다. 
            적당한 Scale Up 또한 필요합니다. 
 
![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/3d9eedde-0251-4872-b9bd-09ae2d6706a7) 
* 네트워크가 동일한 public subnet에 있다면 보안상 문제가 발생합니다. 외부에서 접근할 수 없도록  EC2 인스턴스와 RDS 인스턴스는 각각의 subnet에 위치하여야하고 관리자는 bastion을 통해 접근하여야합니다. 
 
추가적으로 CICD (Continuous Integration/Continuous Delivery) : 프로젝트 배포와 테스트를 자동적으로 진행함에 따라 
불필요한 노동력을 없앨 예정입니다. 
</details>


<br>

<br>

#### 2) [김규환] 영수증 등록, 맛집 검색
<details>
  <summary>📌 핵심 기능 설명</summary>

  📌 https://docs.google.com/presentation/d/1ctdr4CTAJIyls9e24kb9k101kQK0VD6m/edit?usp=sharing&ouid=104520414346845957015&rtpof=true&sd=true  
  📌 위 링크엔 핵심 기능의 상세한 설명과 근거, 서버 아키텍쳐 구성, 트러블 슈팅에 대한 설명이 준비 되어있습니다. 
<br>
<br>
  🔜 개선사항 : **DataValidationService에 있는 서비스 각각의 케이스들을 분리하여 절차지향적으로 테스트코드를 작성하고, 리팩토링을 할 수 있게 대비할 예정입니다.**

  ##### `1. OCR을 활용한 영수증 등록`
  * 1. 먼저 유저는 업로드할 영수증 파일을 준비합니다. then Drag and Drop 을 사용하여 영수증을 Submit 합니다.
  * 2. FileUploadService 레이어에서 업로드 된 영수증은 AWS S3에 저장되고 bytes data로 OCR API를 호출합니다. 
  * 3. OCRService 레이어에서 추출된 데이터의 주소(지번, 도로명), 전화번호, 결제일시를 
  * 4. MZRegularExpression 에서 직접 구현한 자바 정규식으로 처리후 일반화(통일화) 과정을 거칩니다.
  * 5. 일관성을 가진 추출데이터는 List에 저장되어 validation test를 수행할 것입니다.
  * 6. DataValidationService 레이어에서 등록이 첫 번째 인지 두 번째 인지 혹은 DB에 저장되어도 되는 데이터인지 검사후 DB로 들어갑니다.
  * 7. RestAPI 방식으로 Front에 리턴하여 각각의 결과에 맞는 값을 가지고 마커를 등록할지 혹은 경고메시지를 보낼지 결정합니다.
  * **‼결과‼** 영수증 등록 시 2번 등록에 성공하면 최초 등록자 기준 마커가 지도에 등록됩니다..

  ##### `2. 검색 기능`
  * 유저가 검색할 수 있는 경우의 수는 3가지 입니다. 
  * 정확한 상호명 검색
  * 상호명에 포함된 부분 키워드로 다중 검색	
  * 음식 카테고리로 다중 검색 
  * -자동완성기능을 추가하여 각각의 경우의수에 추가로 부분 키워드를 내포하는 키워드를 자동완성 해줍니다.
  * 지도 새로 고침 기능을 추가하였습니다. 
  * 서버쪽으로 보내는 요청은 모든 키워드에서 영수증이 등록된 식당의 데이터를 가져오게 하는 것입니다. 
  * 한 글자씩 쳐도 계속해서 쿼리를 수행하여 느린 전송 결과를 받는 상황이었지만 
  * 캐시 역할을 하는 List를 서버쪽에 구현하여 가져온 결과가 있으면 Response 하지 않도록 구현하였습니다. (실제 캐시는 구현하지 않았습니다)
  * 결과 검색버튼을 누를시 마커를 등록하고 마커에 이름과 상세페이지로 넘어갈 수 있는 A태그를 구현하였습니다.
  * A태그는 검색 결과중 주소를 가지고 검색하고 따라서 상세페이지를 각각 보여줄 수 있게 됩니다. 
  * 이후 개선방안으로는 가게의 고유 아이디만을 이용해 상세페이지를 가져올 수 있도록 수정하는 것입니다. 

  * **‼결과‼** 검색결과를 가지고 마커를 찍어주며 상세페이지로 이동할 수 있게됩니다.
	
</details>

<details>
  <summary>⚽ 트러블 슈팅</summary>

<br>
	
  ##### `1. 자동완성 캐시 기능`
	
<details>
	
  <summary>👉문제 및 해결방안 , 결과 확인</summary>
	
 * 문제 : 검색어 자동완성 기능으로 검색을 하게되면 매 자음 모음마다 DB에서 불러와 매 호출마다 많은양의 데이터를 가져왔습니다. 따라서 데이터가 많아지면 호출이 늦어지는 문제 발생 5~6초씩 자동완성에 소요되는 시간이 길었습니다.
 * 해결 방안 : 따라서 캐시처럼 동작하는 리스트를 만들어 가져온게 있다면 쿼리를 response 하지 않게 만들었습니다. 
 * 결과 : 5~6초씩 걸리던 자동완성이 0.1초도 안되어 계속 캐시처럼 남아있게 응답 시간 개선 

![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/2fc4fae5-d284-4505-8dc1-fcadfa9b6814)

	
</details>

  ##### `2. 여러개의 마커가 각각의 인포윈도우로 인식 안되는 문제 `
	
<details>
	
  <summary>👉문제 및 해결방안 , 결과 확인</summary>
	
![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/a1bd24a2-d75b-469f-94fb-ff25b342b101)

![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/3ef8ff71-f5ca-457d-82c2-ae6871d4d6dd)
	
  * 문제 : 위 사진1 에서 나온 값들이 , 사진2 에 한 주소로만 계속 동시에 찍히는 문제 발생, 
  * 원인 : 

	![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/cc673ed4-f133-4bea-b811-17c6815d6336)
	
  * 해결 방안 : 클로저 함수를 이용하여 함수를 호출할 때마다 새로운 독립적인 환경을 생성

  * 설명 : 함수를 호출할 때마다 새로운 독립적인 환경을 생성해야 할 때 클로저를 활용할 수 있습니다.
  * 해당 코드에서는 for문을 통해 생성된 각 마커와 이름을 클로저 함수의 인자로 전달하고 있습니다. 
  * 클로저 함수는 전달받은 마커와 이름을 사용하여 이벤트 리스너를 등록합니다.
  * 각각의 클로저 함수는 자신이 생성될 때의 렉시컬 환경을 기억하고 있기 때문에, 
  * 클로저 함수 내부에서 사용되는 변수(marker, name)는 해당 클로저 함수가 생성될 당시의 값으로 유지됩니다. 
  * 이를 통해 각 마커와 이름이 클로저 함수 내부에서 독립적으로 사용될 수 있게 됩니다. 
  * 따라서 각 마커를 클릭할 때 해당 마커에 연결된 이름이 인포윈도우로 표시됩니다.
  * 이를 통해 각 마커마다 고유한 이름을 표시할 수 있으며, 클로저를 사용하여 함수 외부에서 해당 이름에 접근할 수 있도록 구현하였습니다.
	
  <div markdown="1">    
	  
  ```java
	'''
		function addMarker(name,position) {
			            // 마커를 생성합니다
			            var marker = new kakao.maps.Marker({
			                position: position,
			                clickable: true
			            });
			            // 마커가 지도 위에 표시되도록 설정합니다
			            marker.setMap(map);
			            var iwContent = '<div style="padding:5px;"><a href="https://map.kakao.com/link/to/Hello World!,'+ marker.getPosition().getLat()+','+ marker.getPosition().getLng()+'" style="color:blue" target="_blank">길찾기</a>'+name+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
<!-- /////////////////////////////////////////////////////////////////////////////// -->
		
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

  ```
	  
  </div>
</details>	
  

</details>

<br>


</details>


