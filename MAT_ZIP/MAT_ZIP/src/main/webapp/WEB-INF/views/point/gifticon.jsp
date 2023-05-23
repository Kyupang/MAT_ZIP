<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$('#1').click(function() {
			$('#result').empty()
			$.ajax({
				type : 'post',
				url : "exchange",
				data : {
					user_id : "home",
					id : 1
				},
				success : function(data) {
					alert(data);
				},
				error : function(xhr, status, error) {
					alert("포인트 잔액이 부족합니다.");
				}
			})//ajax
		})//b1
		$('#2').click(function() {
			$('#result').empty()
			$.ajax({
				type : 'post',
				url : "exchange",
				data : {
					user_id : "home",
					id : 2
				},
				success : function(data) {
					alert(data);
				},
				error : function(xhr, status, error) {
					alert("포인트 잔액이 부족합니다.");
				}
			})//ajax
		})//b2
	})//$
</script>
</head>
<body>
	<c:forEach items="${list}" var="bag">
		<button id="${bag.id}">${bag.name}
			<img src="${bag.img}">
		</button>
	</c:forEach>
	<hr color="red">
	<div id="result" style="background: yellow"></div>
</body>
</html>