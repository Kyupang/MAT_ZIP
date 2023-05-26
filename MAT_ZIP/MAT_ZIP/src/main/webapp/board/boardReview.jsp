<%@page import="com.mat.zip.mzMember.model.MzMemberDTO"%>
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
<h1>회원커뮤니티 - 리뷰게시판 입니다. </h1>
	
	<%-- 세션에 저장된 회원 정보 가져오기 --%>
	<% String user_id = (String) session.getAttribute("user_id"); %>
	<%= user_id != null ? user_id + " 님이 로그인 중입니다." : "" %>
	
	<% if (user_id == null) { %>
		! 로그인이 필요합니다. ! 
		<a href="../mz_member/login" class="order_online">
		      LOGIN
		</a>
	<% } else { %>
		<hr color="green">
		<br>
		<form action="writeReview" id="form" method="get">
			<button type="submit" style="background: #c5ff9c;">리뷰 게시글 작성하기</button>
		</form>
		<br>
	<% } %>
	
	<hr color=green>
	<div id="result" style="background: #ecffd1"></div>
	<hr color=green>
	<a href="boardIndex.jsp">
		<button style="background: #ecffd1;">게시판 index 페이지로 돌아가기</button>
	</a>
</body>
</html>