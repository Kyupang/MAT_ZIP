<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<style>
  @import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap')
	; 
</style>
<meta charset="UTF-8">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> --> <!--감정분석추가 -->


<title>Chart.js Test</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	<!-- <script src="../resources/js/boss_chart.js"></script>boss_chart.js파일을 추가 -->
	<link href="../resources/css/boss.css" rel="stylesheet"><!-- boss.css 파일을 추가 -->
<!-- 매출 차트  -->	
<script type="text/javascript">
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    var storeId = '<%= session.getAttribute("store_id") %>'; /* 세션에서 storeId 가져오기 */
    var encodedStoreId = encodeURIComponent(storeId);
    console.log('chart/' + encodedStoreId);
    $.ajax({
        url: 'chart/'+ encodedStoreId,
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            /* console.log(response); */
            var data = new google.visualization.DataTable();
            data.addColumn('number', '날짜'); //날짜 대신에 달의 날짜를 표시
            data.addColumn('number', '이번달');
            data.addColumn('number', '저번달');
			
            /* 이번달,저번달 총 매출액  */
            var thisMonthData = response.thisMonthTotal;
			var lastMonthData = response.lastMonthTotal;
			
			var thisMonthTotalAmount = thisMonthData.reduce(function (total, item) {
			    return total + item.total_amount;
			}, 0);
			
			var lastMonthTotalAmount = lastMonthData.reduce(function (total, item) {
			    return total + item.total_amount;
			}, 0);
			
		
            // HTML 태그에 매출액 설정
            document.getElementById('thisMonthTotal').textContent = '이번달 총매출: ' + thisMonthTotalAmount.toLocaleString('ko-KR') + '원';
			document.getElementById('lastMonthTotal').textContent = '저번달 총매출: ' + lastMonthTotalAmount.toLocaleString('ko-KR') + '원';

            
            /* 최근7일간의 이번달과 저번달 매출액  */
            var thisMonthData = response.thisMonth;
            var lastMonthData = response.lastMonth;
            /* reduce함수 */
            var thisMonthDays = thisMonthData.reduce(function(total, item) { return total + item.total_amount; }, 0);
            var lastMonthDays = lastMonthData.reduce(function(total, item) { return total + item.total_amount; }, 0);
         
         	// HTML 태그에 매출액 설정
            document.getElementById('thisMonthDays').textContent = '같은기간 이번달 매출: ' + thisMonthDays.toLocaleString('ko-KR') + '원';
            document.getElementById('lastMonthDays').textContent = '같은기간 저번달 매출: ' + lastMonthDays.toLocaleString('ko-KR') + '원';

            var rows = [];

            for (var i = 0; i < thisMonthData.length; i++) {
                var dateParts = thisMonthData[i].date.split("-");
                if (dateParts.length === 3) {
                    var dayOfMonth = dateParts[2];
                    rows[dayOfMonth] = [parseInt(dayOfMonth), thisMonthData[i].total_amount, null];
                } else {
                    console.log(`날짜 형식이 잘못되었습니다: ${thisMonthData[i].date}`);
                }
            }

            for (var i = 0; i < lastMonthData.length; i++) {
                var dateParts = lastMonthData[i].date.split("-");
                if (dateParts.length === 3) {
                    var dayOfMonth = dateParts[2];
                    if(rows[dayOfMonth]) {
                        rows[dayOfMonth][2] = lastMonthData[i].total_amount;
                    } else {
                        rows[dayOfMonth] = [parseInt(dayOfMonth), null, lastMonthData[i].total_amount];
                    }
                } else {
                    console.log(`날짜 형식이 잘못되었습니다: ${lastMonthData[i].date}`);
                }
            }

              // Add rows to data table
            Object.keys(rows).forEach(function(key) {
    		data.addRow(rows[key]);
			});
                   
           	
            var options = {
                chart: {
                    title: '<%= session.getAttribute("store_id") %>',
                    subtitle: '일별매출, 월별비교'
                },
                width: 1200,
                height: 400,
                hAxis: {
                  //날짜 포맷설정 format:'D' 원하는 문자열 삽입
                   
                },
                vAxis: {
                    format: '#,###원'  // Y축 단위변경 
                },
                series: {
                    0: { color: '#0064FF' }, // 이번달 선 색상
                    1: { color: '#FF9100' }  // 저번달 선 색상
                }
            };

            var chart = new google.charts.Line(document.getElementById('linechart_material'));

            chart.draw(data, google.charts.Line.convertOptions(options));
        },
        error: function(error) {
            console.log(error);
        }
    });
}

</script>
<!-- 재방문율 차트 -->
	 <!-- 이번달,지난달 재방문율 차트 조회 -->
	<script type="text/javascript">
	google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var storeId = '<%= session.getAttribute("store_id") %>';
        var encodedStoreId = encodeURIComponent(storeId);
        $.ajax({
            url: 'returnCustomerCount/' + encodedStoreId,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
            	console.log(response);
            
            	var thisMonthNewCustomers = response.thisMonthNew.new_customers;  /* 이번달 신규 고객 수 */
            	var thisMonthReturningCustomers = response.thisMonthReturning.returning_customers; /* 이번달 재방문 고객 수 */

            	var lastMonthNewCustomers = response.lastMonthNew.new_customers; /* 저번달 신규 고객 수 */
            	var lastMonthReturningCustomers = response.lastMonthReturning.returning_customers; /* 저번달 재방문 고객 수 */

            	/* 재방문 고객 증가율 */
            	var returningCustomerGrowth; 
            	if (lastMonthReturningCustomers === 0) {
            	  returningCustomerGrowth = thisMonthReturningCustomers > 0 ? 100 : 0;
            	} else {
            	  returningCustomerGrowth = (thisMonthReturningCustomers - lastMonthReturningCustomers) / lastMonthReturningCustomers * 100;
            	}
            	console.log(returningCustomerGrowth);

            	/* 신규 고객 증가율 */
            	var newCustomerGrowth; 
            	if (lastMonthNewCustomers === 0) {
            	  newCustomerGrowth = thisMonthNewCustomers > 0 ? 100 : 0;
            	} else {
            	  newCustomerGrowth = (thisMonthNewCustomers - lastMonthNewCustomers) / lastMonthNewCustomers * 100; 
            	}

                /* 도넛 차트 데이터 생성 */
                var data = google.visualization.arrayToDataTable([
                    ['Customer', 'Count'],
                    ['신규주문\n'+returningCustomerGrowth.toFixed(2) + '%', thisMonthNewCustomers],
                    ['재주문\n'+newCustomerGrowth.toFixed(2) + '%', thisMonthReturningCustomers]
                ]);

                 /* 도넛 차트 옵션 */
                var options = {
                    title: '재주문율 비교',
                    pieHole: 0.3,
                    stroke: {
                        0: { color: '#0064FF' }, // 이번달 선 색상
                        1: { color: '#FF9100' }  // 저번달 선 색상
                    }
                };

                /* 도넛 차트 그리기 */
                var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                chart.draw(data, options);

                /* HTML 태그에 데이터 설정 */
                document.getElementById('returningCustomerGrowth').textContent = '재방문 고객 증가율: ' + returningCustomerGrowth.toFixed(2) + '%';
                document.getElementById('newCustomerGrowth').textContent = '신규 고객 증가율: ' + newCustomerGrowth.toFixed(2) + '%';
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
</script>
<!-- 재방문율 -->
	 <!-- 2~5번 방문한 단골고객의 수 차트 -->
	<script type="text/javascript">
	 google.charts.load("current", {packages:['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	    	var storeId = '<%= session.getAttribute("store_id") %>';
	        var encodedStoreId = encodeURIComponent(storeId);
	        $.ajax({
	            url: 'orderCount/' + encodedStoreId,
	            type: 'GET',
	            dataType: 'json',
	            success: function (response) {
	            	console.log(response);
	            	var twoOrders = response.twoOrders.twoOrderCustomers;  /* 2번주문한 고객 수 */
	            	var threeOrders = response.threeOrders.threeOrderCustomers; /* 3번주문한 고객 수 */
	            	var fourOrders = response.fourOrders.fourOrderCustomers; /* 4번주문한 고객 수 */
	            	var fiveOrders = response.fiveOrders.fiveOrderCustomers; /* 5번주문한 고객 수 */
	            	
				      var data = google.visualization.arrayToDataTable([
				        ["Element", "방문횟수", { role: "style" } ],
				        ["2번", twoOrders, "#b87333"],
				        ["3번", threeOrders, "silver"],
				        ["4번", fourOrders, "gold"],
				        ["5번", fiveOrders, "color: #e5e4e2"]
				      ]);
			
				      var view = new google.visualization.DataView(data);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);
			
				      var options = {
				        title: "여러번 방문한 단골손님",
				        width: 600,
				        height: 400,
				        bar: {groupWidth: "95%"},
				        legend: { position: "none" },
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("여러번주문차트"));
				      chart.draw(view, options);
				  },
				  error: function (error) {
		                console.log(error);
		            }
		        });
		    }
</script>
<!-- 재방문율 차트 -->
	 <!-- 이번달,저번달 신규고객, 재주문 고객 총액  -->
 <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawOrderTotalChart);

      function drawOrderTotalChart() {
        var storeId = '<%= session.getAttribute("store_id") %>';
        var encodedStoreId = encodeURIComponent(storeId);
        $.ajax({
            url: 'orderTotal/' + encodedStoreId,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                /* 신규고객 */
                var thisMonthNewTotal = response.thisMonthNewTotal.newOrderTotalThisMonth; //이번달 신규고객 결제금액
                var lastMonthNewTotal = response.lastMonthNewTotal.newOrdersTotalLastMonth; //저번달 신규고객 결제금액 
                /* 재주문고객  */
                var thisMonthReturnTotal = response.thisMonthReturnTotal.returningOrderTotalThisMonth; //이번달 재주문 고객 결제금액
                var lastMonthReturnTotal = response.lastMonthReturnTotal.returningOrderTotalLastMonth; //저번달 재주문 고객 결제금액

                var dataOrderTotal = google.visualization.arrayToDataTable([
                	  ['고객 타입', '지난 달', '이번 달'],
                	  ['신규고객 주문금액', lastMonthNewTotal, thisMonthNewTotal],
                	  ['재주문고객 주문금액', lastMonthReturnTotal, thisMonthReturnTotal]
                	]);
                
                var formatter = new google.visualization.NumberFormat( //단위지정
                        {pattern: '#,###원'}
                    );
                    formatter.format(dataOrderTotal, 1); // Apply formatter to second column.
                    formatter.format(dataOrderTotal, 2); // Apply formatter to third column.

                var options = {
                  chart: {
                    title: '<%= session.getAttribute("store_id") %>',
                    subtitle: '신규고객, 재주문고객 금액비교',
                  },
                  bars: 'horizontal',
                  colors: ['#76A7FA', '#703593'] // 색지정
                };

                var chart = new google.charts.Bar(document.getElementById('MonthTotal'));

                chart.draw(dataOrderTotal, google.charts.Bar.convertOptions(options));
            },
            error: function (error) {
                console.log(error);
            }
        });
      }
    </script>
    <!-- 재방문율 차트 -->
	 <!-- 이번달, 저번달 재주문 회원 주문건수, 총액 -->
 <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawOrderCountChart);

      function drawOrderCountChart() {
        var storeId = '<%= session.getAttribute("store_id") %>';
        var encodedStoreId = encodeURIComponent(storeId);
        $.ajax({
            url: 'orderTotal/' + encodedStoreId,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                /* 신규고객 */
                var thisMonthNewOrder = response.thisMonthNewTotal.newOrdersThisMonth; //이번달 신규고객 주문수
                var lastMonthNewOrder = response.lastMonthNewTotal.newOrdersLastMonth; //저번달 신규고객 주문 수
                /* 재주문고객  */
                var thisMonthReturnOrder = response.thisMonthReturnTotal.returningOrdersThisMonth;//이번달 재주문 고객 주문수
                var lastMonthReturnOrder = response.lastMonthReturnTotal.returningOrdersLastMonth; //저번달 재주문 고객 주문수

                var dataOrderCount = google.visualization.arrayToDataTable([
                	  ['고객 타입', '지난 달', '이번 달'],
                	  ['신규고객 주문 수', lastMonthNewOrder, thisMonthNewOrder],
                	  ['재방문고객 주문 수', lastMonthReturnOrder, thisMonthReturnOrder]
                	]);
                var formatter = new google.visualization.NumberFormat( //단위지정
                        {pattern: '#명'}
                    );
                    formatter.format(dataOrderCount, 1); // Apply formatter to second column.
                    formatter.format(dataOrderCount, 2); // Apply formatter to third column.

                var options = {
                  chart: {
                    title: '<%= session.getAttribute("store_id") %>',
                    subtitle: '신규고객, 재주문고객 주문 수 비교',
                  },
                  bars: 'horizontal',
                  colors: ['#c2a91f', '#092073'] // 여기서 색상을 지정합니다
                };

                var chart = new google.charts.Bar(document.getElementById('MonthOrder'));

                chart.draw(dataOrderCount, google.charts.Bar.convertOptions(options));
            },
            error: function (error) {
                console.log(error);
            }
        });
      }
    </script>
    <!-- 신규고객,재방문고객 결제금액 증가율  -->
    <script type="text/javascript">

    $(document).ready(function() {
        var storeId = '<%= session.getAttribute("store_id") %>';
        var encodedStoreId = encodeURIComponent(storeId);
        $.ajax({
            url: 'orderTotal/' + encodedStoreId,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
            	/* 신규고객 */
            	var thisMonthNewOrder = response.thisMonthNewTotal.newOrdersThisMonth;  /* 이번달 신규 고객 주문수 */
            	var thisMonthNewTotal = response.thisMonthNewTotal.newOrderTotalThisMonth;  /* 이번달 신규 고객 총 결제금액 */
            	var lastMonthNewOrder = response.lastMonthNewTotal.newOrdersLastMonth; /* 지난달 신규 고객 주문수 */
            	var lastMonthNewTotal = response.lastMonthNewTotal.newOrdersTotalLastMonth; /* 지난달 신규 고객 총 결제금액 */
				/* 재주문고객  */
            	var thisMonthReturnOrder = response.thisMonthReturnTotal.returningOrdersThisMonth; /* 이번달 재주문 고객 주문수 */
            	var thisMonthReturnTotal = response.thisMonthReturnTotal.returningOrderTotalThisMonth; /* 이번달 재주문 고객 총 결제금액 */
            	var lastMonthReturnOrder = response.lastMonthReturnTotal.returningOrdersLastMonth; /* 저번달 재주문 고객 주문수 */
            	var lastMonthReturnTotal = response.lastMonthReturnTotal.returningOrderTotalLastMonth; /* 저번달 재주문 고객 총 결제금액 */
            	/* 여기서부터 로직 짜야댐 */
            	/* 신규 고객 결제금액 증가율 */
				var newOrderTotalGrowth; 
				if (lastMonthNewTotal === 0) {
				    newOrderTotalGrowth = thisMonthNewTotal > 0 ? 100 : 0;
				} else {
				    newOrderTotalGrowth = (thisMonthNewTotal - lastMonthNewTotal) / lastMonthNewTotal * 100; 
				}
				
				/* 신규 고객 주문건 증가율 */
				var newOrderCountGrowth; 
				if (lastMonthNewOrder === 0) {
				    newOrderCountGrowth = thisMonthNewOrder > 0 ? 100 : 0;
				} else {
				    newOrderCountGrowth = (thisMonthNewOrder - lastMonthNewOrder) / lastMonthNewOrder * 100; 
				}
				
				/* 재주문 고객 결제 금액증가율 */
				var returnOrderTotalGrowth; 
				if (lastMonthReturnTotal === 0) {
				    returnOrderTotalGrowth = thisMonthReturnTotal > 0 ? 100 : 0;
				} else {
				    returnOrderTotalGrowth = (thisMonthReturnTotal - lastMonthReturnTotal) / lastMonthReturnTotal * 100;
				}
				console.log(returnOrderTotalGrowth);
				
				/* 재주문 고객 주문건 증가율 */
				var returnOrderCountGrowth; 
				if (lastMonthReturnOrder === 0) {
				    returnOrderCountGrowth = thisMonthReturnOrder > 0 ? 100 : 0;
				} else {
				    returnOrderCountGrowth = (thisMonthReturnOrder - lastMonthReturnOrder) / lastMonthReturnOrder * 100;
				}
				console.log(returnOrderCountGrowth);
				
				// 신규 고객 결제금액 증가율, 소수점 이하 잘라내기
	            var newOrderTotalGrowth = calculateGrowth(thisMonthNewTotal, lastMonthNewTotal);
	            // 신규 고객 주문건 증가율, 소수점 이하 잘라내기
	            var newOrderCountGrowth = calculateGrowth(thisMonthNewOrder, lastMonthNewOrder);
	            // 재주문 고객 결제 금액증가율, 소수점 이하 잘라내기
	            var returnOrderTotalGrowth = calculateGrowth(thisMonthReturnTotal, lastMonthReturnTotal);
	            // 재주문 고객 주문건 증가율, 소수점 이하 잘라내기
	            var returnOrderCountGrowth = calculateGrowth(thisMonthReturnOrder, lastMonthReturnOrder);

	            /* HTML 태그에 데이터 설정 */
	            formatGrowth(newOrderTotalGrowth, 'newOrderTotalGrowth');
	            formatGrowth(newOrderCountGrowth, 'newOrderCountGrowth');
	            formatGrowth(returnOrderTotalGrowth, 'returnOrderTotalGrowth');
	            formatGrowth(returnOrderCountGrowth, 'returnOrderCountGrowth');

	        },
	        error: function (error) {
	            console.log(error);
	        }
	    });
	});
//소수점 자르고, 양수면 ↑ , 음수면 ↓ 표시
	function calculateGrowth(thisMonth, lastMonth) {
	    var growth;
	    if (lastMonth === 0) {
	        growth = thisMonth > 0 ? 100 : 0;
	    } else {
	        growth = (thisMonth - lastMonth) / lastMonth * 100; 
	    }
	    return Math.floor(growth); // 소수점 이하를 잘라냅니다.
	}

	function formatGrowth(growth, elementId) {
	    var element = document.getElementById(elementId);
	    if(growth >= 0) {
	        element.innerHTML = '↑<span style="color:green; font:bold;">' + growth + '%</span>';
	    } else {
	        element.innerHTML = '↓<span style="color:red; font:bold;">' + Math.abs(growth) + '%</span>';
	    }
	}

</script>
<!-- 감성분석 차트 -->
    <script>
    $(document).ready(function() {
            var storeId = '<%= session.getAttribute("store_id") %>';
            var encodedStoreId = encodeURIComponent(storeId);

            $.ajax({
                url: 'analyze/' + encodedStoreId,
                type: 'GET',
                dataType: 'json',
                contentType: 'application/json; charset=UTF-8',
                success: function(response) {
                    console.log("성공시 응답받은 데이터: " + JSON.stringify(response, null, 2));
                    // 필드들을 표시할 <div> 요소 가져오기
                    var resultElement = $("#result");

                    // 기존 결과 초기화
                    resultElement.empty();

                    // 통계 변수 초기화
                    var totalCount = response.length;
                    var positiveCount = 0;
                    var negativeCount = 0;
                    var neutralCount = 0;

                    // response 객체를 순회하며 필드들을 <div>에 표시
                    for (var i = 0; i < response.length; i++) {
                        var review = response[i];
                        /* resultElement.append("<p>리뷰 내용: " + review.sentences[0].content + ", 감정 분석 결과: " + review.document.sentiment); */

                        // 통계 카운트 계산
                        if (review.document.sentiment === "positive") {
                            positiveCount++;
                        } else if (review.document.sentiment === "negative") {
                            negativeCount++;
                        } else {
                            neutralCount++;
                        }
                    }

                    var positivePercentage = (positiveCount / totalCount) * 100;
                    var negativePercentage = (negativeCount / totalCount) * 100;
                    var neutralPercentage = (neutralCount / totalCount) * 100;
					/* 퍼센트 표시할시 사용 */
                    /* resultElement.append("<p>긍정 리뷰: " + positivePercentage.toFixed(2) + "%</p>");
                    resultElement.append("<p>부정 리뷰: " + negativePercentage.toFixed(2) + "%</p>");
                    resultElement.append("<p>중립 리뷰: " + neutralPercentage.toFixed(2) + "%</p>"); */
                    
                    google.charts.load("current", {packages:["corechart"]});
                    google.charts.setOnLoadCallback(drawChart);
                    function drawChart() {
                      var data = google.visualization.arrayToDataTable([
                        ['Task', 'Hours per Day'],
                        ['좋아요', positivePercentage],
                        ['아쉬워요', negativePercentage],
                        ['나쁘지않아요', neutralPercentage]
                      ]);

                      var options = {
                        title: '<%= session.getAttribute("store_id") %>'+ ' 리뷰 감정분석',
                        is3D: true,
                      };

                      var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                      chart.draw(data, options);
                    }
                },

                error: function(error) {
                    alert('감정 분석 중 오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        });
</script>
	<!-- 감정분석 긍정탑5 부정탑5 -->
	<script>
	$(document).ready(function() {
	    var storeId = '<%= session.getAttribute("store_id") %>';
	    var encodedStoreId = encodeURIComponent(storeId);

	    $.ajax({
	        url: 'analyze/' + encodedStoreId,
	        type: 'GET',
	        dataType: 'json',
	        contentType: 'application/json; charset=UTF-8',
	        success: function(response) {
	            console.log("성공시 응답받은 데이터: " + JSON.stringify(response, null, 2));

	            // 필드들을 표시할 <div> 요소 가져오기
	            var resultElement = $("#result");

	            // 기존 결과 초기화
	            resultElement.empty();

	            // 긍정 리뷰와 부정 리뷰를 분리하기
	            var positiveReviews = response.filter(function(review) {
	                return review.document.sentiment === "positive";
	            });
	            var negativeReviews = response.filter(function(review) {
	                return review.document.sentiment === "negative";
	            });

	            // 각각의 리스트를 정렬하기
	            positiveReviews.sort(function(a, b) {
	                return b.document.confidence.positive - a.document.confidence.positive;
	            });
	            negativeReviews.sort(function(a, b) {
	                return b.document.confidence.negative - a.document.confidence.negative;
	            });

	            // 최대 5개의 긍정 리뷰와 부정 리뷰 선택하기
	            var maxPositiveReviews = positiveReviews.slice(0, 5);
	            var maxNegativeReviews = negativeReviews.slice(0, 5);

	            // 최대 긍정 점수가 높은 리뷰 표시
	            resultElement.append("<h3>긍정 리뷰 TOP 5</h3>");
	            for (var i = 0; i < maxPositiveReviews.length; i++) {
	                var review = maxPositiveReviews[i];
	                var reviewElement = $("<p>").text("리뷰 내용: " + decodeURIComponent(review.sentences[0].content) + ", 감정 분석 결과: " + review.document.sentiment);
	                resultElement.append(reviewElement);
	            }

	            // 최대 부정 점수가 높은 리뷰 표시
	            resultElement.append("<h3>부정 리뷰 TOP5</h3>");
	            for (var i = 0; i < maxNegativeReviews.length; i++) {
	                var review = maxNegativeReviews[i];
	                var reviewElement = $("<p>").text("리뷰 내용: " + decodeURIComponent(review.sentences[0].content) + ", 감정 분석 결과: " + review.document.sentiment);
	                resultElement.append(reviewElement);
	            }
	        },

	        error: function(error) {
	            alert('감정 분석 중 오류가 발생했습니다. 다시 시도해주세요.');
	        }
	    });

	});

	</script>



</head>
<body>
	<div class="container">
	<div><h1 style="width:1200px; height:80px;"><i class="bi bi-shop"> <span style="color:#0938d6; font:bold"><%= session.getAttribute("store_id") %></span> 매출 차트</i></h1></div>
	<div id="linechart_material" style="width: 600px; height: 500px"></div>
	<ul>
	<li><div class="text-bg-primary p-3">
	<div id="thisMonthDays">같은기간 이번달 매출</div><div id="thisMonthTotal">이번달 총 매출</div></li>
	<li><div class="text-bg-warning p-3">
	<div id="lastMonthDays">같은기간 저번달 매출</div>
	<div id="lastMonthTotal">저번달 총 매출</div></li>
	</ul>	
	</div>
	<hr style="border: dashed 10px #121d40;" align="center">
	
	
	<br>
	<div class="container">
	<div class="row">
	<div><h1 style="width:1200px; height:80px;"><i class="bi bi-shop"> <span style="color:#0938d6; font:bold"><%= session.getAttribute("store_id") %></span> 재주문율 차트</i></h1></div>
	<table>
	<tr>
	<td>
	<div id="donutchart" style="width: 800px; height: 500px;"></div>
	</td>
	<td>
	<div id="여러번주문차트" style="width: 600px; height: 400px;"></div>
	</td>
	</tr>
	</table>
	</div>
	</div>
	
	<div class="container">
	<div class="row">
	<table>
	<tr>
	<td><div class="text-bg-primary p-3">
	<div id="returningCustomerGrowth"></div></div></td>
	<td>
	<div class="text-bg-warning p-3">
	<div id="newCustomerGrowth"></div></div>
	</td>
	</tr>
	</table>
	</div>
	</div>
	
	<hr style="border: dashed 10px #121d40;" align="center">
	<br>
	<div class="container">
	<div><h1 style="width:1200px; height:80px;"><i class="bi bi-shop"> <span style="color:#0938d6; font:bold"><%= session.getAttribute("store_id") %></span> 신규고객,재주문고객 금액 비교</i></h1></div>
	<div id="MonthTotal" style="width: 900px; height: 500px;"></div>
	</div>
	
	<div class="container">
	<div id="MonthOrder" style="width: 900px; height: 500px;"></div>
	</div>
	
	<hr style="border: dashed 10px #121d40;" align="center">
	<br>
	<div class="container">
	<div class="row">
	<div><h1 style="width:1200px; height:80px;"><i class="bi bi-shop"> <span style="color:#0938d6; font:bold"><%= session.getAttribute("store_id") %></span> 총 결제금액, 주문수 비교</i></h1></div>
	<ul>
	<li>신규고객 결제금액 증가율<div id="newOrderTotalGrowth" class="text-bg-warning p-3"></div></li>
	<li>재주문 고객 결제금액 증가율<div id="returnOrderTotalGrowth" class="text-bg-light p-3"></div></li>
	<li>신규 고객 주문 건 증가율<div id="newOrderCountGrowth" class="text-bg-warning p-3"></div></li>
	<li>재주문 고객 주문 건 증가율<div id="returnOrderCountGrowth" class="text-bg-light p-3"></div></li>
	</ul>
	</div>
	</div>
	
	<hr style="border: dashed 10px #121d40;" align="center">
	<br>
	<div class="container">
	<div><h1 style="width:1200px; height:80px;"><i class="bi bi-shop"> <span style="color:#0938d6; font:bold"><%= session.getAttribute("store_id") %></span> 리뷰 감정분석 차트</i></h1></div>
	<div id="piechart_3d" style="width: 1000px; height: 500px;"></div>
	<div id="result">리뷰긍정5부정5표시되는곳</div>
	</div>
	
</body>

</html>