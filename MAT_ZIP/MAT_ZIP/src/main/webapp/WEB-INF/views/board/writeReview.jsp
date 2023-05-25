<%@page import="com.mat.zip.board.ReviewVO"%>
<%@page import="com.mat.zip.registerAndSearch.model.MZRegisterInfoVO"%>
<%@page import="com.mat.zip.registerAndSearch.model.RestaurantVO"%>
<%@page import="com.mat.zip.board.MZRegisterReceiptDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛.zip 회원커뮤니티 - 리뷰 작성하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<h1>회원커뮤니티 - 리뷰 작성하기 입니다. </h1>
	<%
		if (session.getAttribute("user_id") == null) {
			response.sendRedirect("login");
			return;
		}
	%>
	<hr color="green">
	${session.getAttribute("user_id")} 님이 로그인 중입니다.
	<br>
	
	<form action="insertReview" id="form" method="post">
	    <h2>영수증 선택:</h2>
	    <c:forEach items="${receiptList}" var="receipt">
    		<input type="radio" id="${receipt.mzRegisterInfoVO.no}" name="receipt_id" value="${receipt.mzRegisterInfoVO.no}">
    		<label for="${receipt.mzRegisterInfoVO.no}">${receipt.restaurantVO.name} (${receipt.mzRegisterInfoVO.storeAddress})</label><br>
		</c:forEach>
	
	    <input type="hidden" name="user_id" value="${session.getAttribute('user_id')}">
	    <input type="hidden" id="selectedReceipt" name="selectedReceipt" value=""> 
	    <button type="submit" style="background: #c5ff9c;">선택한 영수증으로 리뷰 작성하기</button>
	</form>
	<br>
	<hr color=green>
	<a href="boardReview.jsp">
		<button style="background: #ecffd1;">리뷰게시판으로 돌아가기</button>
	</a>
	
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#form').on('change', function(e) {
		        if (e.target.name === 'receipt_id') {
		            $('#selectedReceipt').val(e.target.value);
		        }
		    });
		});
	</script>
</body>
</html>