<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$('#result').empty()
		$.ajax({
			type : 'post',
			url : "pointinquiry",
			data : {
				user_id : "home",
			},
			success : function(data) {
				$('#result').append(data)
			},
			error : function(error) {
				console.error('Error:', error);
			}
		})//ajax
	})//$
</script>
</head>
<body>
	<div id="result" style="background: yellow"></div>
</body>
</html>