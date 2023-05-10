<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
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
	<%
		if (session.getAttribute("id") != null) {
	%>
	<a href="boardInsert.jsp"><button class="btn btn-success">글쓰기</button></a>
	<%
		}
	%>
</body>