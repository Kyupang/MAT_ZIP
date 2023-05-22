<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$('#b1').click(function() {
			$('#result').empty()
			$.ajax({
				url : "exchange",
				data : {
					user_id : "home",
					id : 1
				},
				success : function(x) {
					alert("성공: " + x);
				}
			})//ajax
		})//b1
	})//$
</script>
</head>
<body>
	<c:forEach items="${list}" var="bag">
		<button id="b1">${bag.name}</button>
	</c:forEach>
	<hr color="red">
	<div id="result" style="background: yellow"></div>
</body>
</html>