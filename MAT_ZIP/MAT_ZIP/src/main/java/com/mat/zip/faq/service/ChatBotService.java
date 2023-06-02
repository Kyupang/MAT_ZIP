package com.mat.zip.faq.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mat.zip.faq.model.ChatSendReq;

@Service
public class ChatBotService {
	private String secretKey= "SERaTmtlUWpNdUpPS3VTbHVWUm16a2VKSnFlSWVKZU4=";
	private String invokeUrl = "https://gl0vqlotmd.apigw.ntruss.com/custom/v1/10591/37ba6b8e4c562bb5463d0400d2a0334a81eadcc8c0beedfaf52edc6f41c1daa3";
	
	public String invoke(String sessionId, ChatSendReq csr) {
		String chatbotmessage = null;
		
		try {
			ObjectMapper om = new ObjectMapper();
			String body = om.writeValueAsString(csr);
			
			String encodeBase64String = makeSignature(body);
			
			URL url = new URL(invokeUrl);
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);
            con.setDoOutput(true);
			
            BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(con.getOutputStream(), Charset.forName("UTF-8")));
            wr.write(body); //요청 바디 쓰기
            wr.flush();
            wr.close();
            
            if (con.getResponseCode() == 200) { //정상 호출 200 ok
            	BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				String decodedString;
				while ((decodedString = in.readLine()) != null) {
					chatbotmessage = decodedString;
				}
				in.close();
			} else { //다른 에러 호출
				chatbotmessage = con.getResponseMessage(); //어떤 에러인지 체크해서 리턴
			}
		} catch (Exception e) {
			System.out.println("service_invoke_error: " + e);
		}
		return chatbotmessage;
	}
	
	public String makeSignature(String body) {
		String encodeBase64String = "";
		try {
			byte[] secretKeyBytes = secretKey.getBytes(StandardCharsets.UTF_8);
			SecretKeySpec secretKeySpec = new SecretKeySpec(secretKeyBytes, "HmacSHA256");
			
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(secretKeySpec);
			
			byte[] signture = mac.doFinal(body.getBytes(StandardCharsets.UTF_8));
			encodeBase64String = Base64.getEncoder().encodeToString(signture);
			
			return encodeBase64String;
		} catch (Exception e) {
			System.out.println("service_makeSignature_error: " + e);
		}
		
		return encodeBase64String;
	}
	
	public String open(String sessionId) {
		ChatSendReq csr = new ChatSendReq();
		csr.setTimestamp(System.currentTimeMillis());
		csr.setEvent("open");
		csr.setUserId(sessionId);
		//csr.setUserId(UUID.randomUUID().toString());
		
		return invoke(sessionId, csr);
	}
	
	public String send(String sessionId, String message) {
		ChatSendReq csr = new ChatSendReq();
		csr.setTimestamp(System.currentTimeMillis());
		csr.setEvent("send"); 
		csr.setUserId(sessionId);
		csr.addText(message);
		
		return invoke(sessionId, csr);
	}

}
