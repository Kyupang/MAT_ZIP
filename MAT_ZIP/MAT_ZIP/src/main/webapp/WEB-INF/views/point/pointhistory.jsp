<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td {
	width: 100px;
	text-align: center;
}

.top {
	background: black;
	color: white;
}

  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  .tableHeader thead th{
  	position: sticky;
  	top: 0px;
  	color: white;
  	background: black;
  }
  .tableHeader tbody tr td a{
  	color: black;
  }
</style>
</head>
<body>
<div style="overflow: auto; height: 70%">
	<table class="tableHeader" style="width: 100%; text-align: center;">
		<tr>
			<td class="top">아이디</td>
			<td class="top">타입</td>
			<td class="top">포인트</td>
		</tr>
		<c:forEach items="${list}" var="bag">
			<tr>
				<td class="down">${bag.user_id}</td>
				<td class="down">${bag.type}</td>
				<td class="down">${bag.point}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</html>