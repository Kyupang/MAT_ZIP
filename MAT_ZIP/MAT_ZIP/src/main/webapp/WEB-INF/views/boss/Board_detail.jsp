<%@page import="com.mat.zip.boss.BoardVO"%>
<%@page import="com.mat.zip.boss.ComVO"%>
<%@page import="com.mat.zip.boss.Boss_memberVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script type="text/javascript">
$(document).ready(function() {
	$(document).on('click', '#cominsert', function() {
		content = $('#com').val();
		writer = "${user_id}";
		$.ajax({
			url: "Board_insertcom",
			data: {
				board_id: '${bag.board_id}',
				content: content,
				writer: writer
			},
			success: function(response) {
				$('#result').html(response); // 업데이트된 댓글 목록을 #result 요소에 삽입
			},
			error: function() {
				alert('댓글 요청 실패!');
			}
		});
	});
});
			</script>
<script>
		$(document).ready(function(){
		    $('.like-form').on('submit', function(event){
		        event.preventDefault();
		        var form = $(this);
		        var board_id = form.find('input[name="board_id"]').val();
		        var likeButton = form.find('.like-button');
		
		        $.ajax({
		            url: form.attr('action'),
		            type: 'POST',
		            data: {
		                board_id: board_id
		            },
		            success: function(response) {
		                // '좋아요' 카운트를 업데이트
		                likeButton.text('좋아요 ' + response);
		            }
		        });
		    });
		});
</script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap')
	;

 body {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.id {
	text-align: center;
	position: absolute;
	right: 100px;
	top: 50px;
}
.logout {
	text-align: center;
	position: absolute;
	right: 100px;
	top: 90px;
	z-index: 100;
}

#search {
	position: relative;
	left: 430px;
	bottom: 25px;
}

#main {
	position: relative;
	left: 300px;
}

#main2 {
	position: relative;
	left: 300px;
	bottom: 47px;
} 
</style>
<meta charset="UTF-8">
<title>맛.zip</title>
</head>
<body>

	<div class="container">
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<!--메뉴있던곳  -->
		</div>
	</div>
	<div class="container">
		<!--컨테이너  -->
		<div class="row" class="col-md-9">
			<!-- 로우설정  -->
			<h3>
				<strong><em><span class="badge rounded-pill text-bg-success">자유게시판</span></em></strong>
			</h3>
		</div>
		<br>
		<div class="row" class="col-md-9">
			<!-- 로우설정  -->
			<h3>
				<strong><em>${bag.title}</em></strong>
			</h3>
		</div>
		<div class="row" class="col-md-9">
			<h5>${bag.writer}</h5>
		</div>
		<div class="row" class="col-md-9">
			<h6>${bag.content}</h6>
		</div>
	</div>

<form action="like" method="post" class="like-form">
    <input type="hidden" name="board_id" value="${bag.board_id}">
    <button type="submit" class="like-button">좋아요 ${bag.likecount}</button>
</form>

	<hr color="green">
	
		<div class="container">
			<div class="row">
				<h4>
					<strong>댓글</strong>
				</h4>
				<div id="result">
				<div id="result table">
				<table>
					<c:forEach items="${Com_list}" var="bag">
						<tr>
							<em><span style="border-bottom: 2px solid green;">${bag.writer}<br></span></em>
						</tr>
						<tr>${bag.content}<br>
						</tr>
						<tr>
							<fmt:formatDate value="${bag.regdate}" pattern="yyyy-MM-dd HH:mm" />
							<hr>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<!-- 댓글 -->
	<div class="container">
		<%
		if (session.getAttribute("boss_id") != null) {
		%>
		<h5 style="color: green;">회원:${nickName}</h5>

		<input id="com">
		<button id="cominsert" class="btn btn-outline-success">작성</button>
		<br>

		<%
			} else {
		%>로그인시 작성가능<%
			}
		%>
		<!--댓글끝 -->


		<hr color="green">
		<%
			//세션에서 값을 꺼내는 방법
		String id = (String) session.getAttribute("user_id");
		//모델에서 값을 꺼내는 방법
		//model.addAttribute("bag",bag)
		BoardVO bag = (BoardVO) request.getAttribute("bag");
		String writer = bag.getWriter();
		// 접속중인 id와 writer가 같으면 수정 , 삭제버튼 출력
		if (id != null) {
			if (id.equals(writer)) {
				// 세션값으로 아래 내용4개를 저장해서 넘김
		session.setAttribute("board_id", bag.getBoard_id());
		session.setAttribute("title", bag.getTitle());
		session.setAttribute("content", bag.getContent());
		session.setAttribute("writer", bag.getWriter());
		%>
		<a href="boardUpdate.jsp">
			<button class="btn btn-outline-success">수정</button>
		</a> <a href="boardDelete.jsp">
			<button class="btn btn-outline-success">삭제</button>
		</a>
		
		<%
			}
		}
		%>
	</div>
	<br>

	<div class="container">
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<table class="table"
				style="text-align: center; border: 1px solid #dddddd">
				<tr class="table-success">
					<td><input type="hidden" id></td>
					<div class="col-md-6">
						<td>제목</td>
					</div>
					<div class="col-md-1">
						<td>글쓴이</td>
					</div>
					<div class="col-md-3">
						<td>작성시간</td>
					</div>
					<div class="col-md-1">
						<td>조회수</td>
					</div>
					<div class="col-md-1">
						<td>좋아요</td>
					</div>
				</tr>
				<c:forEach items="${Board_list}" var="bag">
					<tr>
						<td><input type="hidden" ${bag.board_id}></td>
						<td><a href="Board_detail?board_id=${bag.board_id}">${bag.title}</a></td>
						<td>${bag.writer}</td>
						<td><fmt:formatDate value="${bag.regdate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${bag.viewscount}</td>
						<td>${bag.likecount}</td>

					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- <form action="Board_like" method="get">
	<button>좋아요</button>
</form> -->
</body>
</html>