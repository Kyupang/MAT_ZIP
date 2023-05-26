<%@page import="com.mat.zip.mzMember.model.MzMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛.zip 회원커뮤니티 - 자유게시판</title>
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
	
	
	<% MzMemberDTO member = (MzMemberDTO) session.getAttribute("user_id"); %>
	<%= member != null ? member.getUser_id() + " 님이 로그인 중입니다." : "" %>
	
	<% if (session.getAttribute("user_id") == null) { %>
	
	! 로그인이 필요합니다. ! 
	
	<c:if test="${user_id == null}">
	    <a href="../mz_member/login" class="order_online">
	      LOGIN
	    </a>
	</c:if>
	
	<% } %>
	
	<br>
	<br>
	<a href="boardPostCreate.jsp">
		<button style="background: pink;">자유게시판 게시글 작성하기</button>
	</a>
	<br>

	<hr color=green>
	<div id="result" style="background: #ffd9f7"></div>
	
</body>
</html>