<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>리뷰게시판 - 게시물등록 화면입니다.</h3>

	<hr color="red">
	
	<form action="insertReview" id="form" method="post" enctype="multipart/form-data" >
		회원 ID : <input name="user_id" value="${user_id}" readonly/><br>
		제목 : <input name="post_title" value=""><br>
		리뷰를 등록할 영수증 : <select name="receipt_id">
			<option value="영수증 번호1">영수증 번호1</option>
			<option value="영수증 번호2">영수증 번호2</option>
		</select>
		상호명 : <input name="store_id" value="${store_id}"><br>
		판매 음식 종류 : <select name="store_cg">
			<option value="한식">한식</option>
			<option value="양식">양식</option>
			<option value="중식">중식</option>
			<option value="일식">일식</option>
			<option value="아시안음식">아시안음식</option>
			<option value="기타">기타</option>
		</select><br>
		회원님의 선호 음식 카테고리 : <select name="category">
			<option value="한식">한식</option>
			<option value="양식">양식</option>
			<option value="중식">중식</option>
			<option value="일식">일식</option>
			<option value="아시안음식">아시안음식</option>
			<option value="기타">기타</option>
		</select><br><br>
		
		제목 : <input name="review_title" value="" style="width:500px;" maxlength=100><br>
		내용 : <input name="post_content" value="" style="width:500px; height:200px;" maxlength=1000><br> 
		파일 첨부 : <input type="file" name="file" ><br>
		<br>
		<br>
		emotion : 
			<input type="checkbox" name="emotion" value="주차가능"> 주차가능 
			<input type="checkbox" name="emotion" value="맛있어요"> 맛있어요 
			<input type="checkbox" name="emotion" value="청결해요"> 청결해요 
			<input type="checkbox" name="emotion" value="가성비짱"> 가성비짱 
		<br>
		<br>
		<button type="reset">작성 초기화</button>
		<button type="submit">게시물 작성하기</button>
	</form>
</body>
</html>