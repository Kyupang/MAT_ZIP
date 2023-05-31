<%@page import="com.mat.zip.board.PhotoVO"%>
<%@page import="com.mat.zip.board.PhotoComVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"> /* ajax */ 
	
	// JSP로부터 값을 가져와 JavaScript 변수에 저장
	var photo_id = parseInt("${data.photo_id}");
	var userId = "${data.user_id}";
	var writerId = "${data.user_id}";
	
	$(function() {
		
		// 게시글 로드 완료 후 조회수 증가 요청
		$.ajax({
		    url : "incrementPhotoViewCount",
		    data : {
		        photo_id : photo_id
		    },
		    success : function() {
		        console.log("조회수 증가");
		    },
		    error : function(request, status, error) {
		        console.log("오류 발생");
		    }
		});
		
		// 댓글 list 요청 
		$.ajax({
		    url: "photoComList",
		    type: "GET",
		    data : {
		    	photo_id : photo_id
		    },
		    success : function(data) {
		      // 댓글 리스트를 가져와서 화면에 출력 
		      for (var i = 0; i < data.length; i++) {
	  			var photoCom = data[i];
	  			var updatedDate = new Date(photoCom.updated_date); // 새 Date 객체 생성
	  			var photoComElement = "<p>" + photoCom.photo_comment + ", " + photoCom.user_id + "</p>" +
	                       "<p>댓글 작성 시간: " + updatedDate.toLocaleString() + "</p><hr>";
	  			$("#photoComList").append(photoComElement);
			} // for 
		    }, // success 
		    error : function(jqXHR, textStatus, errorThrown) {
		      console.log(textStatus, errorThrown);
		    } // error 
		  }); // ajax 
		
		  // 댓글 달기 
		  $("#b1").click(function() {
			    var userId = $("#user_id").val(); // input 필드에서 사용자 ID 가져오기
			    var photo_comment = $("#photoCom").val(); // 댓글 내용 
			    if (!userId) { // 사용자가 로그인하지 않은 상태
			        alert("로그인 후 댓글을 작성할 수 있습니다.");
			        return;
			    }
			    
			    $.ajax({
			        type : "POST", // 요청 방식을 POST로 지정
			        url : "createPhotoCom",
			        data : {
			            photo_id: photo_id,
			            user_id: userId, 
			            photo_comment: photo_comment 
			        },
			        success : function() {
			            alert("댓글 달기 성공!");
			            var newRow = "<p>" + photo_comment + ", " + userId + "</p>" + 
			            "<p>댓글 작성 시간: " + new Date().toLocaleString() + "</p><hr>";
			            
			            $("#photoComList").append(newRow);
			            $("#photoCom").val('');
			        }, // success
			        error: function() {
			            alert("댓글 달기 실패!");
			        }
			    }); // ajax  
			}); // b1 

		
			// 수정 버튼 클릭 시
			$("#updateBtn").click(function() {
				if (confirm("정말로 게시물을 수정하시겠습니까?")) {
					$.ajax({
						type: "GET",
						url: "updatePhoto",
						data: {
							photo_id: ${data.photo_id} // 수정하려는 게시물의 id
						},
						success: function() {
							window.location.href = "updatePhoto?photo_id=" + photo_id; // 수정 페이지로 이동
						}
					});
				}
			});
			
		 	// 삭제 버튼 클릭 시
		    $("#deleteBtn").click(function() {
		        if (confirm("정말로 게시물을 삭제하시겠습니까?")) {
		            $.ajax({
		                type: "POST",
		                url: "deletePhoto",
		                data: { 
		                	photo_id: photo_id,
		                	user_id: userId
		                },
		                success: function() {
		                    alert("게시물이 삭제되었습니다.");
		                    window.location.href = "boardPhoto.jsp";
		                },
		                error: function() {
		                    alert("게시물 삭제에 실패했습니다.");
		                }
		            });
		        }
		    });
		  
		  
		  
		
		
	}) // function

	</script>
	
	
	<a href="boardPhoto.jsp">
		<button style="background: #c5ff9c;">사진게시판으로 돌아가기</button>
	</a>
	<hr color="red">
	<br>
	photo id : ${data.photo_id} <br> 
	user id : ${data.user_id} <br>
	<br>
	사진의 음식 종류 : ${data.photo_cg} <br>
	<br>
	${user_id} 님의 선호 음식 카테고리 : ${data.category} <br>
	<br>
	<br>
	제목 : ${data.photo_title} <br>
	내용 : ${data.photo_content} <br>
	<c:choose>
	  <c:when test="${not empty data.photo_file}">
	    <img src="${pageContext.request.contextPath}/resources/img/${data.photo_file}" width=300 height=300> <br>
	  </c:when>
	  <c:otherwise>
	    <p style="color:#919191">첨부 이미지가 없습니다.</p>
	  </c:otherwise>
	</c:choose>
	<br>
	작성 시간 : ${data.created_date}  /  게시물 최종 수정 시간 : ${data.updated_date}
	<br>
	
	<hr color="red">
	
	<c:choose>
	    <c:when test="${sessionScope.user_id == data.user_id}">
	        <button id="updateBtn">게시물 수정</button>
	        <button id="deleteBtn">게시물 삭제</button>
	    </c:when>
	</c:choose>
	
	<hr color="red">
	
	<c:choose>
	    <c:when test="${session.getAttribute('user_id') != null}">
	        회원 ID : <input id="user_id" value="${user_id}" readonly/><br>
	        댓글달기 <input id="photoCom"> <button id="b1">댓글달기</button>
	    </c:when>
	    <c:otherwise>
	        <input id="user_id" type="hidden" value="${user_id}">
	        댓글달기 <input id="photoCom"> <button id="b1">댓글달기</button>
	    </c:otherwise>
	</c:choose>
	
	<div id="photoComList"></div>
	
</body>

</html>