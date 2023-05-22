<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//감정분석 API URL
const apiUrl = "https://naveropenapi.apigw.ntruss.com/sentiment-analysis/v1/analyze";

// Client ID와 Client Secret을 지정해주세요
const clientId = "{3uzmdwnb3e}";
const clientSecret = "{cfeIcnHDzQ5A9vq2Bj7ulYNqDnr7sLVw6MsxTBzO}";

// 분석할 텍스트
const text = "싸늘하다. 가슴에 비수가 날아와 꽂힌다.";

// 요청 설정
const requestOptions = {
  method: 'POST',
  headers: { 
    'X-NCP-APIGW-API-KEY-ID': clientId,
    'X-NCP-APIGW-API-KEY': clientSecret,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({content: text})
};

// 요청 실행
fetch(apiUrl, requestOptions)
  .then(response => response.json())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));


</script>
</body>
</html>