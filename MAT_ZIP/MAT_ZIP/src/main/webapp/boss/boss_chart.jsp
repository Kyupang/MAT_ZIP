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
	
<meta charset="UTF-8">

<title>Chart.js Test</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
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
            console.log(response);
            var data = new google.visualization.DataTable();
            data.addColumn('number', '날짜'); //날짜 대신에 달의 날짜를 표시
            data.addColumn('number', '이번달');
            data.addColumn('number', '저번달');

            var thisMonthData = response.thisMonth;
            var lastMonthData = response.lastMonth;
            
            /* 이번달, 저번달 총매출액 */
            var thisMonthTotal = thisMonthData.reduce(function(total, item) { return total + item.total_amount; }, 0);
            var lastMonthTotal = lastMonthData.reduce(function(total, item) { return total + item.total_amount; }, 0);
            console.log(thisMonthTotal+'원');
            console.log(lastMonthTotal+'원');
         // HTML 태그에 매출액 설정
            document.getElementById('thisMonthTotal').textContent = '이번달 매출: ' + thisMonthTotal.toLocaleString('ko-KR') + '원';
            document.getElementById('lastMonthTotal').textContent = '저번달 매출: ' + lastMonthTotal.toLocaleString('ko-KR') + '원';

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
           	console.log(rows);         	
           	
            var options = {
                chart: {
                    title: '<%= session.getAttribute("store_id") %>',
                    subtitle: '일별매출, 월별비교'
                },
                width: 1200,
                height: 500,
                hAxis: {
                  //날짜 포맷설정 format:'D' 원하는 문자열 삽입
                   
                },
                vAxis: {
                    format: '#,###'  // Y축 단위변경 
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
</head>
<body>
	<div id="linechart_material" style="width: 1200px; height: 500px"></div>
	<div id="thisMonthTotal">이번달 매출</div>
	<div id="lastMonthTotal">저번달 매출</div>

</body>

</html>