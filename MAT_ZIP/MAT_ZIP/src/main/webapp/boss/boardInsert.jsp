<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	bottom: 31px;
}
</style>
<meta charset="UTF-8">
<title>맛.zip 게시물등록</title>
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
		<h3>
			<span class="badge rounded-pill text-bg-success">자유게시판 글 쓰기</span>
		</h3>

		<hr color="green">
		<form action="Board_insert" method="get">
			<input name="writer" value="${id}" type="hidden"
				style="width: 600px;"><br> <input name="title"
				placeholder="제목을 입력해주세요" maxlength="50" style="width: 600px;"><br>
			<br>
			<textarea name="content" placeholder="내용을 입력해주세요" maxlength="1000"
				style="width: 600px; height: 350px;"></textarea>
			<br> <input type="file" name="SelectFile" /><br>
			<hr color="green">
			<button type="submit" class="btn btn-success">등록</button>
		</form>
	</div>

</body>
</html>