$(document).ready(function() {
  // 매출장부 버튼 클릭 시
  $("#bossChartBtn").click(function() {
    $.ajax({
      url: "boss_chartIndex.jsp",
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

  // 자유게시판 버튼 클릭 시
  $("#boardBtn").click(function() {
    $.ajax({
      url: "Board_list",
      method: "GET",
      success: function(response) {
        $("#content").html(response);
      },
      error: function(xhr, status, error) {
        console.log("Error: " + error);
      }
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
