<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <script src="https://js.tosspayments.com/v1/payment"></script>
  </head>
  <body>
    <section>
      <!-- ... -->
      <span>총 주문금액</span>
      <span>15,000 원</span>
      <button id="payment-button">15,000원 결제하기</button>
    </section>
    <script>
      var clientKey = 'test_ck_Wd46qopOB89oxwWnw2OVZmM75y0v'
      var tossPayments = TossPayments(clientKey)
      var button = document.getElementById('payment-button') // 결제하기 버튼
      button.addEventListener('click', function () {
        tossPayments.requestPayment('카드', {
          amount: 15000,
          orderId: '9y7RxePkwux50_Dx3VuYi',
          orderName: '맛도링김치찜',
          customerName: '박토스',
          successUrl: 'http://localhost:8885/mvc200/tossSuccess.jsp',
          failUrl: 'http://localhost:8885/mvc200/tossFail.jsp',
        })
      })
    </script>
    
  </body>
</html>

