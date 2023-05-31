<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert Review</title>    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>    
</head>
<body>

    <script>
	    function searchEmoji() {
	        let review_content = $("#review_content").val();
	
	        $.ajax({
	            url: 'emojiSearch',
	            type: 'post',
	            data: JSON.stringify({ 'review_content': review_content }), // 데이터를 JSON 형식으로 전송합니다.
	            contentType: "application/json; charset=utf-8", // JSON 형식을 알려줍니다.
	            success: function(data) {
	                $("#emojis").empty();
	                for(let i = 0; i < data.length; i++) {
	                    $("#emojis").append(data[i]);
	                }
	                $("#emoticons").val(data.join(","));
	            },
	            error: function(error) {
	                console.log(error);
	            }
	        });
	    }
    </script>

    <h1>리뷰 작성</h1>

    <form action="insertReview" method="post" enctype="multipart/form-data">
        <!-- 영수증 ID는 hidden 필드에 저장하여 form submit과 함께 서버로 전송 -->
        <% String user_id = (String) session.getAttribute("user_id"); %>
		<input type="hidden" name="user_id" value="<%=user_id%>">
		<label for="store_id">영수증 ID (이거 확인만하고 나중에 숨길거임): </label>
        <input type="text" id="receipt_id" name="receipt_id" value="${receipt.mzRegisterInfoVO.no}" readonly>

        <label for="store_id">상호명: </label>
        <input type="text" id="store_id" name="store_id" value="${receipt.restaurantVO.name}" readonly><br/>

        <label for="store_cg">판매 음식 종류: </label>
        <input type="text" id="store_cg" name="store_cg" value="${receipt.restaurantVO.food}" readonly><br/>
		
		 회원님의 선호 음식 카테고리 : <select name="category">
			<option value="한식">한식</option>
			<option value="양식">양식</option>
			<option value="중식">중식</option>
			<option value="일식">일식</option>
			<option value="아시안음식">아시안음식</option>
			<option value="기타">기타</option>
		</select><br>
		
        <label for="review_title">제목: </label>
        <input type="text" id="review_title" name="review_title" required> <br>

        <label for="review_content">리뷰 내용 (1,000자 이내로 작성해주세요.): </label> <br>
        <input type='text' id="review_content" name="review_content" maxlength='1000' required></input>
        <button type="button" onclick="searchEmoji()">이모지 조회하기</button> <br>
        
        <div id="emojis"></div>
		
        <label for="review_file">이미지 파일: </label>
        <input type="file" id="file" name="file"><br/>

        <label for="review_scope">점수: </label>
        <input type="number" id="review_scope" name="review_scope" min="1" max="5" required><br/>
		
		<input type="hidden" id="emoticons" name="emoticons">
		
        <!-- <label for="emotion">감정: </label>
        <input type="text" id="emotion" name="emotion"><br/> -->

        <button type="submit" style="background: #c5ff9c;">리뷰 작성하기</button>
    </form>
</body>
</html>