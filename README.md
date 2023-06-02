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
* Spring Framework 5.0.1
* Maven
* Mybatis
* MySQL 8.0.32

### `Front-end`
* HTML
* CSS
* JavaScript
* JQuery 3.6.4
* BootStrap 4.1

### `Server`
* tomcat 8.5
* AWS

<br>

## 3. 기능 구현
* #### `회원가입, 로그인, 마이페이지, AI챗봇`
  * (각자 본인의 기능 간략하게 작성바람)

* #### `영수증 등록, 검색기능`
  * (각자 본인의 기능 간략하게 작성바람)

* #### `음식점 상세페이지`
  * 음식점 상세정보 CRUD 기능 및 카테고리별 음식점 검색 기능
  * 상세페이지 URL 복사(for 공유하기)
  * 네이버 포털사이트 이동하여 해당 음식점 검색
  * 카카오 API 사용 ► 해당 음식점의 주소를 받아서 지도 띄우기 + 해당 음식점의 위치를 기반으로 카테고리별 장소 검색

* #### `회원 커뮤니티`
  * 맛집에 관심이 있는 소비자가 이용하는 커뮤니티로, 리뷰 / 사진 / 지유게시판으로 나누어 유저 용도에 따라 세부 메뉴를 분류함.
  * 리뷰게시판은 영수증 등록 여부를 체크하여 영수증 등록을 한 유저만 리뷰를 남길 수 있도록 제약사항을 추가하여 리뷰의 신뢰도를 강화함.

* #### `사장 커뮤니티`
  * (각자 본인의 기능 간략하게 작성바람)

* #### `포인트 시스템`
  * 영수증 등록 시 포인트 적립
  * 적립된 포인트를 사용해서 상품교환(기프티콘) SENS API 사용해서 문자로 전송

* #### `캘린더`
  * 방문 예정인 맛집 일정을 등록하고, 확인할 수 있는 캘린더 기능을 구현함.

<br>

<!-- ## 4. ERD 설계
<img src="https://user-images.githubusercontent.com/123634960/242927505-6d8c1885-fd63-41a2-84c7-c521fcce39e7.png"  width="850" height="490">


<br> -->

## 5. 핵심 기능 설명 & 트러블 슈팅

#### 3) 음식점 상세페이지
<details>
  <summary>📌 핵심 기능 설명</summary>
	
  ##### `1. 음식점 상세정보 CRUD 기능`
  * 공공데이터 CSV 찾기 & mzlist테이블에 임의로 맛집으로 선정한 음식점들(약 25곳) 삽입
  * 이미지 저장
	* 공공데이터의 데이터들 중, 임의로 맛집으로 선정한 음식점들(약 25곳)들의 이미지들을 5개씩 저장하여 resources 아래에 이미지 저장 
  * CRUD 기능
	-> 주소 클릭 jsp -> MzlistMapper -> MzlistController -> MzlistDAO -> 상세페이지 jsp파일
	* MzlistMapper
		* mzlist 테이블에서 landNumAddress가 주어진 값과 일치하는 데이터를 조회, resultType으로 지정된 mzlistVO 클래스에 매핑되어 결과를 반환함.
	* MzlistController
		* MzlistController에서 경로 요청이 들어오면, landNumAddress를 사용하여 데이터를 조회하고 Model 객체를 통해서 View와의 상호작용을 통해 View에 데이터를 제공함.
	* MzlistDAO
		* mzlist에서 landNumAddress를 기준으로 데이터를 조회해서 MzlistVO 객체로 반환하는 메서드 사용하여, landNumAddress에 대한 정보를 가져옴.
	
	
  * 이미지 저장 및 출력
	* 공공데이터의 데이터들 중, 임의로 맛집으로 선정한 음식점들(약 25곳)들의 이미지들을 5개씩 저장

	
  * **‼결과‼** 주소를 전달하는 jsp 파일에서 쿼리스트링을 통해 주소를 요청하면 그 주소와 동일한 음식점의 데이터들이 검색되고, 상세페이지 jsp파일에 데이터들이 출력됨.
<!--   * [👉이미지로 전체 흐름 확인하기](null) -->

  ##### `2. 카테고리별 음식점 검색 기능` (위의 음식점 상세정보 CRUD 기능과 유사)
  * CRUD 기능
	-> 주소 클릭 jsp -> MzlistMapper -> MzlistController -> MzlistDAO -> 상세페이지 jsp파일

	
  * **‼결과‼** 카테고리별 음식(한식, 중식, 일식, 분식 등..) 이미지 박스를 클릭하면 해당 음식점 카테고리 페이지로 이동하여 mzlist테이블에 저장되어 있는 해당 카테고리의 음식점들의 상세정보와 이미지들이 출력됨.
<!--   * [👉이미지로 전체 흐름 확인하기](null) -->
	
  ##### `3. 상세페이지 URL 복사(for 공유하기)`
	-> 클립보드에 텍스트를 복사하는 기능
  * 가상의 'texterea' 생성 -> textarea의 값을 복사할 텍스트로 설정 -> textarea를 DOM에 추가 -> textarea 내용을 선택 -> textarea를 DOM에서 제거
	
  * **‼결과‼** URL 복사(공유하기) 버튼을 클릭하면 'URL이 클립보드에 복사되었습니다' 라는 문구의 alert가 뜨며, 'copyToClipboard()' 함수를 호출하여 텍스트를 클립보드로 복사
	
 ##### `4. 네이버 포털사이트 이동하여 해당 음식점 검색`
 	 -> location.href를 사용하여 생성된 URL로 페이지를 이동해서 사용자가 해당 음식점의 'landAddress'와 동일한 주소에 해당하는 네이버지도 URL로 이동할 수 있도록 함.
  * 함수 생성
	* searchOnNaverMaps() -> URL을 생성하고 페이지를 이동하는 역할을 하기 위함.
	* encodeURIComponent() -> name, landAddress, roadAddress를 URL 인코딩하기 위함.
  * 변수 설정
	* 'naverMapsURL' 변수를 생성해서 네이버 지도 URL을 할당
  * location.href를 사용하여 생성된 URL로 페이지 이동
	
  * **‼결과‼** 버튼을 클릭하면 name, landAddress, roadAddress를 인코딩하여 URL에 추가한 후 페이지를 이동   * [👉이미지로 전체 흐름 확인하기](null)
	
 ##### `5. 카카오 API 사용'
 -> 해당 음식점의 주소를 받아서 지도 띄우기 + 해당 음식점의 위치를 기반으로 카테고리별 장소 검색
   * 카카오 API 코드 분석
	
   * **‼결과‼** 상세정보페이지에 해당하는 음식점이 지도 위에 마커로 표시되며, 좌상단의 카테고리별 장소를 클릭하면 장소들이 마커 기준으로 근처에 있는 해당 장소들의 마커가 띄워지고, 마커를 클릭했을 때 카카오맵으로 이동됨.
<!--    * [👉이미지로 전체 흐름 확인하기](null) -->
	
</details>

<details>
  <summary>⚽ 트러블 슈팅</summary>

<br>
	
  ##### `1. 일련의 규칙을 가진 이미지 출력 방법`
	** 문제상황: 카테고리별 음식점 검색 기능 구현 중, 각 음식점에 알맞은 이미지들이 출력되어야 하는데 동일한 음식점의 이미지들이 출력
	 -> 여러 이미지들을 DB에 저장하는 방식에 대한 고민 
	 -> **!!이미지를 DB에 저장할 때 일련의 규칙을 정해서 이미지 저장 -> 일련의 규칙대로 이미지들을 분리하는 작업을 통해 해당 음식점들에 이미지 분배!!**
	 -> mzlist테이블 중, 이미지 칼럼의 한 데이터 값에 여러 이미지 경로들을 저장해서, mapper파일을 통해 해당 mzlist테이블의 row를 읽을 때 그 음식점에 해당하는 이미지들이 모두 읽히도록 함.

  * 첫 번째 시도 : 문자열을 특정 구분자를 기준으로 나누어 배열로 반환해주는 split 합수 사용 -> ❌비정상작동
	
  * 두 번째 시도 : 두 클래스를 하나의 클래스로 구현해도 될 것 같다는 생각에 JoinCkValidator클래스를 만들어 코드를 합친 후 바인딩할 객체가 하나이기 때문에 setValidator() 메서드로 변경 -> ❌비정상작동
    * 하고자 했던 바인딩을 통한 유효성 검사는 잘 되었지만, 잘 되던 데이터 형식 유효성 검사가 작동하지 않았다.
  * 세 번째 시도 : 객체가 하나이지만 혹시나 하는 마음에 addValidators() 메서드로 다시 변경 -> ⭕정상작동!

	
	<details>
	 * 일련의 규칙을 가진 이미지 출력 방법은 여러가지가 될 수 있다. 
	 첫 번째로 시도해 본 방법인 split함수를 사용하는 과정에서 오류가 생겨서 다른 방식을 채택했지만, split함수로도 충분히 구현할 수 있었다는 것을 뒤늦게 깨달았다. 
	split 함수사용할 때의 주의점 중에서 이미지 경로들을 포함한 문자열에 공백이 포함되어 있는 경우, split 함수가 공백도 구분자로 인식하여 분리한다는 특징이 있었고, 이로 인한 오류였다는 것을 깨달았다.
	split 함수에 대한 개념이해가 부족했었고, 함수를 사용할 때 개념과 특징을 잘 파악하고 사용한다면 오류를 잡는 데에 걸리는 시간을 단축할 수 있겠다는 생각을 하게 되었다. 하지만 첫 번째 시도에서 막히는 부분에 대해서 오랜 시간을 붙잡지 않고 또 다른 방법을 떠올려서 코드를 작성했다는 부분에 있어서 의의가 있다.
	  </div>
	
	 ##### `2. Null Point Exception`
	** 문제상황: 메인페이지의 지도 위의 마커를 클릭했을 때 나의 상세페이지로 넘어오도록 구현하는 과정에서, no값이 아닌 landNumAddress를 기준으로 CRUD 기능이 수행되도록 변경하는 과정에서 null-point-exception 발생
	
  * 첫 번째 시도 : no -> landNumAddress로 바꾸는 작업이 mzlistMapper, mzlistController, mzlistDAO에도 모두 알맞게 반영이 되었는지 확인 -> ⭕모두 반영됨!
  * 두 번째 시도 : controller 부분에서 값을 전달받을 때 system.out.println(vo)로 값을 출력해보면서 값이 유실된 지점을 체크 ->  landNumAddress와 model값이 전달될 때 값 전달⭕! dao.one()메서드가 null!!❌값을 반환
  * 세 번째 시도 : dao의 one 메서드가 올바르게 작성이 되었는지 확인 -> ⭕정상작동!
  * 네 번째 시도 : jsp파일에서 landNumAddress 파라미터를 정확하게 전달하고 있는지 확인 -> jsp에서 주소값을 입력하는 형식에 오류 발견 (' '로 인해 landNumAddress을 문자열로 인식)
  * 다섯 번째 시도 : jsp에서 주소값을 입력하는 형식 수정 -> ⭕정상작동!
<details>
  <summary>👉코드확인</summary>

  <div markdown="1">    

  ```java
	'''
	  //비정상 작동 코드
	 if (${'vo.landNumAddress'} || '${vo.roadNameAddress}') {  
	  geocoder.addressSearch(address, function(result, status) {

	  
	  //정상 작동 코드
	  
	if ('${vo.landNumAddress}' || '${vo.roadNameAddress}') {  
	geocoder.addressSearch(address, function(result, status) {

  ```

</details>
</details>
	
<br>

#### 4) 회원 커뮤니티
<details>
  <summary>📌 핵심 기능 설명</summary>
	
  ##### `1. 유저의 영수증 등록 여부를 체크한 리뷰 작성 기능`
  * 회원 커뮤니티 내 리뷰 게시판은 유저가 리뷰를 작성하고, 다른 사람들의 리뷰에 댓글을 남길 수 있는 구조의 게시판 페이지로 구현.
	* 리뷰에 신뢰도를 높이기 위해, 유저의 영수증 등록 여부 판단이 필요함.
	* 영수증을 다수의 식당에 등록하고 리뷰를 작성할 때, 리뷰를 남기고 싶은 영수증을 선택하는 form으로 먼저 이동이 필요함.
  * 리뷰게시판 (Review...) 게시물 등록 로직을 처리하기 위해 registerAndSearch 패키지 안에 있는 MZRegisterInfoVO 와 RestaurantVO의 사용이 필요함. 두 model 모두 다른 패키지에 있지만, public 메소드로 작성되어있기 때문에 board 패키지에 동일 model을 만들지 않고 MZRegisterReceiptDTO 만 생성하여 mzRegisterInfoVO와 restaurantVO를 사용할 수 있도록 함.
  * ReviewMapper.xml에서 mzregisterinfo 와 restaurant 테이블을 join 해서 영수증 정보와 식당 정보를 추출하는 getReceiptWithRestaurant 쿼리 작성. (mzregisterinfo 테이블의 storePhoneNumber 컬럼 데이터와 restaurant 테이블의 tel 컬럼 데이터가 일치하는 restaurant 테이블의 name 컬럼 데이터를 상호명으로 추출)
  * 영수증 1장으로 리뷰를 다회 작성을 막기 위해 cs_review 테이블에 receipt_id 컬럼 (mzregisterinfo의 no 컬럼 데이터를 가져와서 저장) 데이터를 제외하고 영수증 정보와 식당 정보를 추출.
  * **‼결과‼** writeReview로 이동하면 getReceiptWithRestaurant 쿼리를 수행하여 영수증의 상호명 + 주소 가 radio form으로 브라우저에 출력, 유저가 리뷰를 작성할 영수증을 선택하고 리뷰 작성 form으로 이동하도록 구현. (영수증을 등록하지 않은 유저가 writeReview 으로 이동하면 alert 창을 보여주고 리뷰게시판으로 리다이렉트됨.)
	
  ##### `2. 리뷰 본문에서 특정 키워드 추출하여 이모티콘 조회 기능`
  * 유저가 리뷰를 작성 후 제출하기 전에, 이모티콘 조회 버튼을 클릭하면 식당 방문 시 참고할 수 있는 주요 키워드 (ex. 주차, 맛, 청결, 가성비 등) 를 검색해서 이모티콘을 출력해주는 기능을 리뷰 작성 form 에 추가.
  * 기존에는 네이버 Sentiment API를 활용하려고 했으나, 긍정/부정 파트를 퍼센트로 판단해주는 기능이라 다양한 키워드를 검색 후 출력이 필요한 지금 상황에는 API가 약간 맞지 않다고 판단하여 MySQL에 키워드와 이모티콘을 저장한 emojiMap 테이블을 DB에 생성하여 키워드를 저장하는 작업을 진행. (형태소 분리가 필요하지만 일단 테스트)
  * ReviewMapper.xml 에 추가하는 쿼리문에서는 emojiMap 데이터 전체 SELECT 쿼리 , Service 계층에서 리뷰 본문과 emojiMap 테이블의 keyward 컬럼 데이터를 비교해서 일치하는 emoji 컬럼 데이터를 추출 후 모델에 저장하는 작업을 수행.
  * **‼결과‼** 리뷰 작성 form (insertReview) 에서 리뷰 본문을 모두 입력 하고, 이모티콘 조회 버튼을 클릭하면 ajax로 리뷰 하단 div에 추출된 이모티콘이 출력되는 방식으로 비동기처리 이모티콘 조회 기능을 구현. 
	
  ##### `3. 3개의 세부 게시판별 CRUD 기능`
  * 유저가 상황에 맞게 이용할 수 있도록 게시판의 카테고리를 분할, 각 게시판별 CRUD 기능 추가. 게시물 insert 기능은 회원만 접근 가능하도록 작성 버튼을 user_id 세션이 잡혀있는 경우에만 브라우저에 출력되도록 코드 작성, 네비게이션바를 통해 로그아웃하고 브라우저 뒤로가기로 게시물 작성 페이지에 접근했을 때 alert 창 출력 후 게시물 목록 페이지로 리다이렉트 될 수 있도록 예외처리 진행.
  * 상대적으로 기능이 간단한 자유게시판은 Service 계층을 나누지 않았고, 자유게시판 기능 구현 완료 후 리뷰게시판과 사진게시판은 Service 계층을 나누어 기능 추가.
  * 게시판별 제목 search form 추가하여 특정 키워드를 검색할 시 제목에 해당 키워드가 포함되어 있는 게시물 list를 ajax 비동기처리로 브라우저에 출력.
  * 게시판에 필요한 조회수 증가 / 댓글 작성 기능 각 세부 카테고리 게시판에 추가.
  * 게시물 insert 기능은 회원만 접근이 가능하도록 세션 
  * **‼결과‼** 각 세부 카테고리 게시판의 기본 CRUD, 댓글 insert 기능을 구현 완료. 
	
</details>

<br>

#### 5) 사장 커뮤니티
<details>
  <summary>📌핵심 기능 설명</summary>
  
  ##### `1. 토스 API를 이용한 결제하기`
  * 먼저, JavaScript 코드에서는 'https://js.tosspayments.com/v1/payment' JavaScript 라이브러리를 사용하여 TossPayments 객체를 초기화합니다. 이 객체는 토스 결제 클라이언트 키인 clientKey를 인자로 받아, 결제 시스템과의 연결을 설정합니다.
  * 사용자가 '결제하기' 버튼을 클릭하면, jQuery를 이용한 이벤트 처리를 통해 requestPayment 함수가 호출됩니다. 이 함수 내부에서는 두 가지 주요 작업을 수행합니다: 첫째, jQuery의 $.ajax 메서드를 사용하여 사용자가 입력한 상점 ID(storeId)의 중복 여부를 서버에 비동기적으로 요청하고 응답을 처리합니다. 둘째, 중복되지 않는 storeId를 확인한 후, 랜덤으로 orderID를 생성합니다. 이렇게 생성된 orderID는 결제 요청 시 사용됩니다. 이 두 작업이 모두 성공적으로 이루어진 경우에만 결제 요청이 이루어집니다.
  * 결제 요청은 TossPayments API로 전송되며, 결제 정보를 담은 JavaScript 객체를 JSON.stringify 함수를 사용하여 JSON 문자열로 변환한 뒤 전송합니다. 이 때, Apache의 CloseableHttpClient와 HttpPost를 사용하여 HTTP 요청을 보내며, 요청 헤더를 setHeader 메서드로 설정하고, 요청 엔티티를 StringEntity 객체를 통해 설정합니다. 결제가 성공적으로 이루어지면, 결제 성공 URL로 이동하게 됩니다.
  * **‼결과‼** 결제하기 버튼 클릭 시 토스 결제 API와 연결되어 상점 ID의 중복 여부를 체크하고 결제를 진행합니다.	
<!--   * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161939355-cac8c85a-0e30-429c-909a-fde92dd30b57.png) -->
  
  ##### `2. 사장 회원 등록`
  * 결제가 성공적으로 완료되면 다음 단계로 넘어가서, 상점 ID(storeId)와 세션의 user_id를 이용해 사장 멤버로의 회원 등록을 처리합니다. 이 과정은 jQuery와 AJAX를 사용하여 클라이언트에서 서버로 비동기적으로 요청을 보내는 방식으로 처리됩니다. 이 AJAX 요청은 특정 엔드포인트인 '/innerJoinAndInsert'로 전송되며, 서버에서는 이 요청을 받아 처리하게 됩니다.
  * 서버 사이드에서는 MemberAndPaymentService 클래스가 이 요청을 처리합니다. MemberAndPaymentService는 의존성 주입(Dependency Injection)을 통해 필요한 객체를 주입받습니다. 이 클래스는 회원 등록과 결제를 동시에 처리하는 트랜잭션을 관리합니다.
  * 클라이언트에서는 AJAX 요청의 성공 여부에 따라 콘솔에 성공 또는 실패 메시지를 출력합니다. 이때 성공 메시지가 출력되는 경우는 서버에서 회원 등록이 정상적으로 완료되었을 때이며, 그렇지 않은 경우 실패 메시지가 출력됩니다. 회원 등록 요청이 성공적으로 처리되면, 클라이언트에서는 이 storeId를 세션에서 제거합니다. 이를 통해 사용자의 인터페이스를 업데이트하고, 상점 ID를 재사용 가능하게 만듭니다.
  * **‼결과‼** 서버에서 회원 등록이 성공적으로 처리되면, 클라이언트 콘솔에 성공 메시지가 출력되고, 상점 ID는 세션에서 제거됩니다.
<!--   * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161939367-2daf8776-9865-45d0-94bf-3eb7ba5bf886.png) -->

  ##### `3. 결제 내역 저장하기`
  * 결제가 성공적으로 완료된 후, 결제 내역은 서버로 전송됩니다. 이 정보는 /payment 엔드포인트로 전송되며, 서버는 이 정보를 받아 데이터베이스에 저장합니다. 이 때의 서버 사이드 처리는 PaymentService와 PaymentController 클래스에서 수행되며, 이들 클래스 역시 의존성 주입을 통해 필요한 객체를 주입받습니다.
  * PaymentVO 객체에는 주문 ID, 결제 금액, 주문 이름 등의 정보가 포함되어 있습니다. 이러한 정보는 서버로부터 받은 응답에서 추출하며, 이 과정에서 Apache의 HttpComponents 클라이언트를 사용합니다.
  * 클라이언트는 CloseableHttpClient 객체를 사용하여 서버로 HTTP 요청을 전송합니다. 이때 HttpPost 객체를 사용하여 요청 헤더와 엔티티를 설정합니다. 헤더는 클라이언트와 서버가 데이터를 어떻게 처리해야 할지에 대한 정보를 전달하고, 엔티티는 POST 요청을 통해 서버로 전송될 데이터를 담고 있습니다.
  * 요청이 서버로 전송된 후, 클라이언트는 CloseableHttpResponse 객체를 통해 서버로부터의 응답을 받습니다. 서버로부터 받은 응답은 EntityUtils의 toString 메서드를 사용하여 문자열로 변환합니다. 이 문자열은 JSON 형태로 되어 있으므로, JsonParser.parseString 메서드를 사용하여 JSON 문자열을 JsonObject로 파싱합니다.
  * 이렇게 파싱된 JsonObject에서, 주문 ID, 결제 금액, 주문 이름 등의 정보를 추출하여 PaymentVO 객체에 설정합니다. 이렇게 생성된 PaymentVO 객체는 서버에 보내집니다. 이를 통해 서버는 결제가 성공적으로 이루어졌음을 확인하고, 해당 결제 정보를 데이터베이스에 저장할 수 있습니다.
  * **‼결과‼** 결제 정보가 서버에 전달되고, 해당 정보가 데이터베이스에 성공적으로 저장됩니다.
<!--   * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161939367-2daf8776-9865-45d0-94bf-3eb7ba5bf886.png) -->

</details>
	
	
<br>

#### 6) 포인트 시스템
<details>
  <summary>📌 핵심 기능 설명</summary>
	
  ##### `1. OCR을 활용한 영수증 등록 시 포인트 적립`
  * 먼저 OCR을 통한 영수증 등록 로직을 처리하는 DataValidationService에 포인트 적립 로직을 처리하는 PointSaveHistoryService를 @Autowired를 이용해 의존성 주입.
  * (DataValidationService에 있는 로직을 통해 영수증 등록의 가능여부를 판단한 이후 PointSaveHistoryService 로직이 동작하여, 따로 유효성 검사 로직을 사용하지 않았음)
  * PointSaveHistoryService에서는 @Autowired로 PointSaveHistoryDAO를 주입해 메서드 호출.
  * PointSaveHistoryDAO에 주입된 mybatis의 SqlSessionTemplate을 이용해서 pointMapper.xml에 있는 쿼리문을 수행.
  * **‼결과‼** 영수증 등록 시 등록에 성공하면 포인트 적립. DB 테이블에 포인트 내역 저장.

  ##### `2. 네이버 클라우드 SENS API를 활용한 포인트 교환(기프티콘)`
  * 기프티콘 교환 API를 사용하려 했으나 개인의 테스트 용도로 사용이 불가능하여, 네이버 SENS API를 이용해 원하는 상품 선택 시 해당 상품의 이미지를 MMS로 전송해주는 방법사용
    최대한 기존의 기프티콘 교환 방식과 비슷하게 구현.
  * 마이페이지에서 포인트 교환 페이지로 이동 -> 원하는 상품 선택 -> PointExchangeHistoryController에 Service 레이어 호출(세션에 저장된 user_id와 AJAX의 요청 data를 매개변수 전달)
  * Service 레이어에서 보유 포인트를 확인 후 상풍의 가격과 비교해서 보유 포인트가 적을 시 예외처리를 했습니다.
  * 보유 포인트를 확인 후 사용한 포인트를 DB에 저장하고, SENS API를 통해 MMS를 전송하게 됩니다.
  * @Transactional을 통해 예외 발생시 포인트 내역에 저장되기 전으로 롤백하도록 처리했습니다.(root-context에 Exception 설정을 추가해서 모든 예외 발생시 롤백되도록 설정했습니다)
  * **‼결과‼** 보유 포인트가 충분하고, 상품 교환에 성공 시 팝업창을 통해 결과를 알려주고, 회원의 핸드폰번호로 MMS가 전송되게 됩니다. 
	
  ##### `3. 포인트 상세이력 관리`
  * 배민 우아한기술블로그 참고(https://techblog.woowahan.com/2587/) 도메인 로직을 참고해서 설계했습니다.
  * 적립을 할 때 Insert만 존재하는 도메인 모델로 구현하였습니다.
  * 포인트를 사용하고 남은 포인트의 유효기간이 만료되면, 만료된 포인트만 처리해야 하는데 단순한 Insert 모델에서는 처리가 어려워 상세 테이블을 추가하였습니다.
  * 포인트 적립 시 상세 테이블에도 적립 기록이 저장되며, 사용 시 저장된 적립 이력을 큐(Queue)를 이용해서 빠른 시간순으로 정렬된 적립 기록을 불러옵니다.
  * poll을 이용해 List에 저장된 포인트를 상품의 가격과 비교하여 다시 상세 테이블에 저장하고, 상품의 가격이 0원이 되면 종료되는 로직을 구현했습니다.
  * 유효기간만료 이벤트가 발생하면 테이블의 적립아이디를 기준으로 GROUP BY해서 남은 금액을 만료 처리 하면됩니다.
  * 이렇게 하면 기존의 update 로직보다 상세한 이력관리가 가능합니다.
</details>

<details>
  <summary>⚽ 트러블 슈팅</summary>

<br>
	
  ##### `1. 포인트 교환 예외발생 시 트랜잭션(transaction) 롤백 미작동`
  * @Transactional exChange메소드 내부 checkPoint(), insertUsePoint(), sendSms() 메서드 Exception 발생 시 기존 DB에 저장된 데이터를 롤백
  * 첫 번째 시도 : sendSms() 메서드에 테스트용 런타임 에러 적용(DB에 저장된 후 동작하는 메서드) DB 롤백 확인  -> ❌롤백 미작동
  * 두 번째 시도 : root context에 트랜잭션 Bean 추가. -> ❌롤백 미작동
  * 세 번째 시도 : cglib 라이브러리를 추가 / servlet context에 proxy-target-class 속성 추가 -> ⭕정상작동!
	* Spring AOP 사용. 인터페이스를 사용하나 proxy-target-class 속성을 사용하기 위해 cglib 라이브러리 추가
	* DB설정을 root context 쪽에 할 경우, 이 DB설정은 servlet context쪽에 설정된 Bean들에는 적용이 안된다.
	* transaction관련 설정을 servlet context에 해줘야한다.
<details>
  <summary>👉코드확인</summary>

  <div markdown="1">    

  ```java
	@Override
	@Transactional
	// 적립 포인트 상품 교환 비즈니스 로직
	public void exChange(String user_id, int id) {

		PointSaveHistoryVO userpoint = PointExchangeHistoryDAO.pointsaveFind(user_id);
		ProductPointVO product = PointExchangeHistoryDAO.productPointFind(id);

		try {
			// 보유 포인트 확인 메서드
			checkPoint(userpoint, product);
			// 보유 포인트 확인 후 교환된 포인트 INSERT
			insertUsePoint(userpoint, product);
			// 교환된 기프티콘 이미지 MMS 전송
	  		sendSms(userpoint, product);
	  
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	// MMS 전송(네이버 SENS API)
	private void sendSms(PointSaveHistoryVO userpoint, ProductPointVO product) {
	  
		SendSmsVO sms = new SendSmsVO();
		sms.setUser_id(userpoint.getUser_id());
		sms.setImg(product.getImg());
		//sms.setTel(tel);
	  
		sensapi.sendSMS(sms);
	  
		throw new IllegalArgumentException("메세지 전송 오류");
	}
  ```
  </div>
</details>
</details>

<br>

#### 7) 캘린더
<details>
  <summary>📌 핵심 기능 설명</summary>
    
  ##### `캘린더 API를 참고한 캘린더`
  * 캘린더 화면 출력 관련 코드 CalController에 Autowired로 CalDAO의 인스턴스를 주입해 메서드 호출. => 스프링의 의존성 주입
  * CalDAO에 주입된 mybatis의 SqlSessionTemplate를 이용해서 CalMapper.xml에 있는 쿼리문을 수행
  * **‼결과‼** 일정을 등록하고, 등록된 일정을 수정 및 삭제할 수 있음. DB 테이블에 등록/수정/삭제된 데이터 반영.
</details>

<details>
  <summary>⚽ 트러블 슈팅</summary>
  ##### `1. 500에러들(문법적 오류)`
  * 첫 번째 문제 : cal.do와 cal을 혼용하여 써서 인식을 제대로 하지 못한 문제 => .do와 같은 수식어를 붙이는 건 불필요한 관습이니 쓰지 않도록.
  * 두 번째 문제 : mybatis=confog.xml에 타입알리아스 맵퍼 등록을 안 해둔 문제.
  * 세 번째 문제 : CalDAO에서 interface 바로 쓸 수 없음.
    
  ##### `2. 새로 알게 된 것`
  * 첫 번째 : css와 jsp에 스타일 적용이 둘 다 되어있다면 css가 먼저 적용된다. => css는 외부에서 구한 자료이기에 수정을 하기 까다로워서 중앙배열 같은 문제는 java코드로 손보는 것에 어려움이 있음.
  * 두 번째 : jsp만 수정한 것은 서버를 중지하지 않고 구현 화면에서 바로 새로고침해도 적용이 되지만 자바코드가 수정된 것은 서버를 중지시킨 후 재실행해야 반영이 된다.(ex.Mapper에서 수정되면 서버 재실행)

<br>

</details>


