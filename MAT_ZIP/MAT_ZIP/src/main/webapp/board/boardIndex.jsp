<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛.zip 회원커뮤니티</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#result").empty();
        $.ajax({
            url : "allPost",
            success : function(data) {
            	$('#result').append(data)
            },
            error:function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            } // error
        }); // ajax
	}); // $ 
</script>
	<h1>맛.zip 회원 커뮤니티</h1>
	<br>
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
	
		
	<%-- <% } else { %>
	
	로그인이 필요합니다. 
	
	<a href="login.jsp">
		<button style="background: yellow;">로그인페이지로 이동하기</button>
	</a>
	
	<% } %> --%>
	
	<br>
	<br>
	<a href="boardReview.jsp">
		<button style="background: pink;">리뷰게시판</button>
	</a>
	<a href="boardPhoto.jsp">
		<button style="background: pink;">맛집 사진첩</button>
	</a>
	<a href="boardPost.jsp">
		<button style="background: pink;">자유게시판</button>
	</a>
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
	<div id="result" style="background: #ffd9f7"></div>
	<a href="../index.jsp">
		<button style="background: grey;">index로 돌아가기</button>
	</a>
</body>
</html>