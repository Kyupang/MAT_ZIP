package com.mat.zip.boss;

import org.json.JSONObject;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@Service
public class SentimentAnalysisService {
    public ResponseEntity<String> analyzeSentiment(String reviewContent) {
        String clientId = "3uzmdwnb3e";  // 클라이언트 ID
        String clientSecret = "cfeIcnHDzQ5A9vq2Bj7ulYNqDnr7sLVw6MsxTBzO";  // 클라이언트 Secret

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("X-NCP-APIGW-API-KEY-ID", clientId);
        headers.set("X-NCP-APIGW-API-KEY", clientSecret);

        JSONObject requestBody = new JSONObject();
        requestBody.put("content", reviewContent);

        HttpEntity<String> entity = new HttpEntity<>(requestBody.toString(), headers);

        URI uri = UriComponentsBuilder.fromHttpUrl("https://naveropenapi.apigw.ntruss.com/sentiment-analysis/v1/analyze")
                .build()
                .encode()
                .toUri();

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = null;
        try {
            response = restTemplate.exchange(uri, HttpMethod.POST, entity, String.class);
        } catch (HttpClientErrorException e) {
            System.out.println(e.getStatusCode());
            System.out.println(e.getResponseBodyAsString());
            throw new RuntimeException("감정 분석 API 호출 중 에러가 발생하였습니다. 에러 내용: " + e.getResponseBodyAsString(), e);
        }

        if (response.getStatusCode() == HttpStatus.OK) {
            return response;
        } else {
            throw new RuntimeException("감정 분석 API 호출 결과가 정상이 아닙니다. HTTP 상태 코드: " + response.getStatusCode());
        }
    }
}

