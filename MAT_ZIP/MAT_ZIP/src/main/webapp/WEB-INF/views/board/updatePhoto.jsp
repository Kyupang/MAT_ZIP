<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>사진게시판 - 게시물 수정 화면입니다.</h3>
	<hr color="red">
	<form action="updatePhoto" id="form" method="post" enctype="multipart/form-data" >
		회원 ID : <input name="photo_id" value="${data.photo_id}" readonly/><br>
		회원 ID : <input name="user_id" value="${user_id}" readonly/><br>
		제목 : <input name="photo_title" value="${data.photo_title}"><br>
		게시물의 사진 카테고리 : <select name="photo_cg" value="${data.photo_cg}">
			<option value="한식">한식</option>
			<option value="양식">양식</option>
			<option value="중식">중식</option>
			<option value="일식">일식</option>
			<option value="아시안음식">아시안음식</option>
			<option value="기타">기타</option>
		</select><br>
		회원님의 선호 음식 카테고리 : <select name="category" value="${data.category}">
			<option value="한식">한식</option>
			<option value="양식">양식</option>
			<option value="중식">중식</option>
			<option value="일식">일식</option>
			<option value="아시안음식">아시안음식</option>
			<option value="기타">기타</option>
		</select><br>
		내용 : <input name="photo_content" style="width:500px; height:200px;" maxlength=140 value="${data.photo_content}"><br> 
		파일 첨부 : <input type="file" name="file"><br>
		<br>
		<button type="submit">게시물 작성하기</button>
	</form>
</body>
</html>