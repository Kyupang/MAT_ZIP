<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛.zip 회원커뮤니티 - 리뷰게시판</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#result").empty();
        $.ajax({
            url : "allReview",
            success : function(data) {
            	$('#result').append(data)
            },
            error:function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            } // error
        }); // ajax
	}); // $
</script>
	<%
		if (session.getAttribute("user_id") == null) {
			session.setAttribute("user_id", "admin");
		}
	%>
	<hr color="green">
	${session.getAttribute("user_id")} 님이 로그인 중입니다.
	<br>
	<br>
	<form action="writeReview" id="form" method="get">
		<button type="submit" style="background: #c5ff9c;">리뷰 게시글 작성하기</button>
	</form>
	<!-- <a href="/WEB-INF/views/board/insertReview.jsp">
		<button style="background: pink;">리뷰 게시글 작성하기</button>
	</a> -->
	<br>
	<!--
	<%
		// if (session.getAttribute("user_id") == null) {
	%>
	<hr color="green">
	<h3>회원 로그인이 필요합니다.</h3>
	<br>
	<form action="login" method="get">
		회원 ID : <input name="user_id" value="admin"><br> 비밀번호 : <input
			name="user_pw" value="1234"><br>
		<button type="submit">로그인</button>
	</form>
	<br>
	<br>
	<%
		// } else {
	%>
	<hr color="green">
	${user_id} 님이 로그인 중입니다.
	<br>
	<a href="2_PostCRUD.jsp">
		<button style="background: pink;">커뮤니티 게시물 글 작성하기</button>
	</a>
	<br>
	<%
		// }
	%>
	-->
	<hr color=green>
	<div id="result" style="background: #ecffd1"></div>
</body>
</html>