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
	$(function() {
		$('#b1').click(function() {
			content = $('#com').val()
			writer = "${id}"
			/* regdate = '${bag.regdate}' */
			$.ajax({
				url : "Board_insertcom",
				data : {
					board_id : '${bag.board_id}',
					content : content,
					writer : writer

				},
				success : function(x) {
					$('#result').load(location.href + ' #result')
					/* $('#result').empty();
					$('#result').append(x); */
					/* location.reload(); */
					/* $('#result').append(
						"- " + content + ", " + writer + "<br>") */
				},
				error : function() {
					alert('computer요청 실패!')
				}//error
			})//ajax
		})//b1
	})//$
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

	<h1 style="color: green;" id="main">
		<a href="board2.jsp"><button class="btn btn-outline-success"
				style="width: 100px; border-bottom: 2px solid green;">
				<em>맛.zip</em>
			</button></a>
	</h1>
	<form action="Board_one" method="get" id="search">
		<input name="board_id" type="text" size="40" placeholder="내용을 입력해주세요">
		<button type="submit" class="btn btn-success">
			검색<i class="bi bi-search"></i>
		</button>
	</form>
	<h3 style="color: gray;" id="main2">
		<em><span style="border-bottom: 2px solid gray;">사장님</span></em>
	</h3>
	<%
		if (session.getAttribute("id") != null) {
	%>
	<h3 style="color: green;">
		<em class="id"><span class="badge text-bg-warning">${id}님</span></em>
	</h3>

	<%
		} else {
	%><a href="owner_login.jsp">
		<button class="btn btn-success">로그인</button>
	</a>
	<a href="owner_member.jsp">
		<button class="btn btn-warning">회원가입화면으로go</button>
	</a>
	<%
		}
	%>


	<div class="container">
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<table class="table"
				style="text-align: center; border: 1px solid #dddddd">
				<tr class="table-success">
					<div class="col-md-3">
						<!-- 12개의 컬럼중에 3개씩 할당 -->
						<td><a href="owner_login">
								<button style="background-color: #fafafa;">
									<h4>매출,마진계산기</h4>
								</button>
						</a></td>
					</div>
					<div class="col-md-3">
						<td><a href="owner_login">
								<button style="background-color: #fafafa;">
									<h4>맛 News</h4>
								</button>
						</a></td>
					</div>
					<div class="col-md-3">
						<td><a href="Board_list">
								<button style="background-color: #fafafa;">
									<h4>자유게시판</h4>
								</button>
						</a></td>
					</div>
					<div class="col-md-3">
						<td><a href="owner_login">
								<button style="background-color: #fafafa;">
									<h4>전문가QnA</h4>
								</button>
						</a></td>
					</div>
				</tr>
			</table>
		</div>
	</div>
	<div class="container">
		<!--컨테이너  -->
		<div class="row" class="col-md-9">
			<!-- 로우설정  -->
			<h3>
				<strong><em><span
						class="badge rounded-pill text-bg-success">자유게시판</span></em></strong>
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
	<hr color="green">
	<div id="result">
		<div class="container">
			<div class="row">
				<h4>
					<strong>댓글</strong>
				</h4>
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
			/* String comid = (String) session.getAttribute("id");
		ComVO combag = (ComVO)request.getAttribute("bag");
		String comwriter = combag.getWriter(); */
		if (session.getAttribute("id") != null) {
		%>
		<h5 style="color: green;">회원:${id}</h5>

		<input id="com">
		<button id="b1" class="btn btn-outline-success">작성</button>
		<br>
		<%-- 		<%  if(comid.equals(comwriter)){}%>
	<h5 style="color: green;" class="id">회원:${id}</h5>

			<input id="com">
			<button id="b1">작성</button>
			<br> --%>

		<%
			} else {
		%>로그인시 작성가능<%
			}
		%>
		<!--댓글끝 -->


		<hr color="green">
		<%
			//세션에서 값을 꺼내는 방법
		String id = (String) session.getAttribute("id");
		//모델에서 값을 꺼내는 방법
		//model.addAttribute("bag",bag)
		BoardVO bag = (BoardVO) request.getAttribute("bag");
		String writer = bag.getWriter();
		if (id != null) {
			if (id.equals(writer)) {
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