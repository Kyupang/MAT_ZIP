package com.mat.zip.boss;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.MediaType;

@RestController
@RequestMapping("/boss")
public class SentimentAnalysisController {
    
	@PostMapping(value = "/analyze", produces = MediaType.APPLICATION_JSON_VALUE)
    public String analyze(@RequestBody Map<String, String> reviewContent) {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();

        headers.set("X-NCP-APIGW-API-KEY-ID", "3uzmdwnb3e");
        headers.set("X-NCP-APIGW-API-KEY", "cfeIcnHDzQ5A9vq2Bj7ulYNqDnr7sLVw6MsxTBzO");
        headers.setContentType(MediaType.APPLICATION_JSON);

        String content = reviewContent.get("content");
        String encodedContent = Base64.getEncoder().encodeToString(content.getBytes(StandardCharsets.UTF_8));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("content", encodedContent);
        String jsonReviewContent = jsonObject.toString();

        HttpEntity<String> entity = new HttpEntity<>(jsonReviewContent, headers);

        String url = "https://naveropenapi.apigw.ntruss.com/sentiment-analysis/v1/analyze";

        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

        return response.getBody();
    }
}

