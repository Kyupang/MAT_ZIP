<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Review</title>
</head>
<body>
    <h1>리뷰 작성</h1>

    <form action="/insertReview" method="post">
        <!-- 영수증 ID는 hidden 필드에 저장하여 form submit과 함께 서버로 전송 -->
        <input type="hidden" name="selectedReceipt" value="${selectedReceipt}" />

        <label for="store_id">상호명: </label>
        <input type="text" id="store_id" name="store_id" required><br/>

        <label for="store_cg">판매 음식 종류: </label>
        <input type="text" id="store_cg" name="store_cg" required><br/>

        <label for="review_title">제목: </label>
        <input type="text" id="review_title" name="review_title" required><br/>

        <label for="review_content">리뷰 내용: </label>
        <textarea id="review_content" name="review_content" required></textarea><br/>

        <label for="review_file">이미지 파일: </label>
        <input type="file" id="review_file" name="review_file" required><br/>

        <label for="review_scope">점수: </label>
        <input type="number" id="review_scope" name="review_scope" min="1" max="10" required><br/>

        <label for="emotion">감정: </label>
        <input type="text" id="emotion" name="emotion" required><br/>

        <input type="submit" value="리뷰 작성">
    </form>
</body>
</html>