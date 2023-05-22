<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>자유게시판 - 게시물등록 화면입니다.</h3>
	<hr color="red">
	<form action="createPost" id="form" method="post" enctype="multipart/form-data" >
		회원 ID : <input name="user_id" value="${user_id}" readonly/><br>
		제목 : <input name="post_title" value=""><br>
		게시물의 음식 카테고리 : <select name="food_cg">
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
		</select><br>
		내용 : <input name="post_content" value="" style="width:500px; height:200px;" maxlength=1000><br> 
		파일 첨부 : <input type="file" name="file" ><br>
		<br>
		<button type="submit">게시물 작성하기</button>
	</form>
</body>
</html>