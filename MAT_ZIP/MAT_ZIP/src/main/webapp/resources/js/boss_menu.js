
$(document).ready(function() {
  // 매출장부 버튼 클릭 시
  $("#bossChartBtn").click(function() {
    $.ajax({
      url: "boss_chart.jsp",
      method: "GET",
      success: function(response) {
        $("#content").html(response); // 내용을 갱신할 공간에 응답 받은 내용 삽입
      },
      error: function(xhr, status, error) {
        console.log("Error: " + error);
      }
    });
  });

  // 맛 News 버튼 클릭 시
  $("#newsBtn").click(function() {
    $.ajax({
      url: "owner_login",
      method: "GET",
      success: function(response) {
        $("#content").html(response);
      },
      error: function(xhr, status, error) {
        console.log("Error: " + error);
      }
    });
  });
// index에 자유게시판 띄우기. 자유게시판 버튼클릭시 
  $(document).ready(function() {
  loadBoardList(); // 페이지 로딩 시 초기 게시판 리스트를 불러옴

  function loadBoardList() {
    $.ajax({
      url: "Board_list",
      method: "GET",
      success: function(response) {
        $("#content").html(response); // 내용을 갱신할 공간에 응답 받은 내용 삽입
      },
      error: function(xhr, status, error) {
        console.log("Error: " + error);
      }
    });
  }

  // 자유게시판 버튼 클릭 시
  $("#boardBtn").click(function() {
    loadBoardList(); // AJAX 요청을 보내서 게시판 리스트를 갱신
  });

  // 페이지 버튼 클릭 시
  $(document).on('click', '.page-link', function(e) {
    e.preventDefault(); // 기본 동작인 페이지 이동을 막음

    var page = $(this).attr('href').split('=')[1]; // 페이지 번호 추출
    loadBoardList(); // AJAX 요청을 보내서 게시판 리스트를 갱신
  });
});


  // 전문가QnA 버튼 클릭 시
  $("#qnaBtn").click(function() {
    $.ajax({
      url: "owner_login",
      method: "GET",
      success: function(response) {
        $("#content").html(response);
      },
      error: function(xhr, status, error) {
        console.log("Error: " + error);
      }
    });
  });
});
