<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공</title>
</head>
<body>
    <%-- <h1>V결제가 완료되었습니다.</h1>
    <p>주문 상품: 사장님 커뮤니티 구독 결제</p>
    <h1>결제 응답 정보: ${paymentResponse.toString()}</h1>
    <p>주문 ID: ${paymentResponse.get("orderId").getAsString()}</p>
    <p>결제 총액: ${paymentResponse.get("totalAmount").getAsInt()}</p>
    <p>주문 이름: ${paymentResponse.get("orderName").getAsString()}</p>
	<p>요청 시간: ${paymentResponse.get("requestedAt").getAsString()}</p> --%>
    
<h1>V결제가 완료되었습니다.</h1>
<p>주문 상품: 사장님 커뮤니티 구독 결제</p>
<p>${paymentResponse.toString()}</p>
<p>주문 ID: <span id="orderId">${paymentResponse.get("orderId").getAsString()}</span></p>
<p>결제 총액: <span id="totalAmount">${paymentResponse.get("totalAmount").getAsInt()}</span></p>
<p>주문 이름: <span id="orderName">${paymentResponse.get("orderName").getAsString()}</span></p>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        var paymentVO = {
            "orderId": $("#orderId").text(),
            "amount": $("#totalAmount").text(),
            "orderName": $("#orderName").text()
        };

        $.ajax({
            type: "POST",
            url: "payment", // 변경이 필요할 수 있습니다.
            contentType: "application/json",
            data: JSON.stringify(paymentVO),
            success: function() {
                alert("결제 정보가 성공적으로 전송되었습니다.");
            },
            error: function() {
                alert("결제 정보 전송에 실패했습니다.");
            }
        });
    });
    
    $(document).ready(function() {
        // 결제 성공 후 AJAX 요청
        if (sessionStorage.getItem("storeId")) {
            $.ajax({
                url: "innerJoinAndInsert",
                method: "POST",
                data: { store_id: sessionStorage.getItem("storeId") }  // 세션에서 storeId 값을 읽어서 AJAX 요청에 포함
            }).done(function() {
                console.log("innerJoinAndInsert 성공");
                sessionStorage.removeItem("storeId");  // 요청이 완료된 후 storeId 값을 세션에서 제거
            }).fail(function() {
                console.log("innerJoinAndInsert 실패");
            });
        }
    });

</script>    
   
</body>
</html>
