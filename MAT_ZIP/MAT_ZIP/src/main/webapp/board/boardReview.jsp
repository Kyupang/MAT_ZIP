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
	<%
		if (session.getAttribute("user_id") == null) {
			// 아래 admin으로 세션 잡아버리는건 수정 필요함!!!
			session.setAttribute("user_id", "admin");
			
			// 이렇게 수정해야댐~ 
			// 먼저 if문 안에 user_id == null 로 잡은걸 != null로 잡고, 
			// ${session.getAttribute("user_id")} 님이 로그인 중입니다. 
			// 추가해주자 그리고 중괄호 닫고  else문 시작, 아래 로그인 필요 else 부분 열고 login 페이지로 이동 
		}
	%>
	<hr color="green">
	${session.getAttribute("user_id")} 님이 로그인 중입니다.
	<br>
	<form action="writeReview" id="form" method="get">
		<button type="submit" style="background: #c5ff9c;">리뷰 게시글 작성하기</button>
	</form>
	<br>
	<%-- <% } else { %>
	리뷰를 작성하려면, 로그인이 필요합니다.
	<% }%> --%>
	<hr color=green>
	<div id="result" style="background: #ecffd1"></div>
	<hr color=green>
	<a href="boardIndex.jsp">
		<button style="background: #ecffd1;">게시판 index 페이지로 돌아가기</button>
	</a>
</body>
</html>