package com.mat.zip.point;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

@Component
public class SensAPI {

	// https://api.ncloud-docs.com/docs/common-ncpapi
	private String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey)
			throws NoSuchAlgorithmException, InvalidKeyException {
		String space = " "; // one space
		String newLine = "\n"; // new line

		String message = new StringBuilder().append(method).append(space).append(url).append(newLine).append(timestamp)
				.append(newLine).append(accessKey).toString();

		SecretKeySpec signingKey;
		String encodeBase64String;
		try {

			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			encodeBase64String = e.toString();
		}

		return encodeBase64String;
	}

	/*
	 * https://api.ncloud-docs.com/docs/ko/ai-application-service-sens-smsv2 {
	 * "type":"(SMS | LMS | MMS)", "contentType":"(COMM | AD)",
	 * "countryCode":"string", "from":"string", "subject":"string",
	 * "content":"string", "messages":[ { "to":"string", "subject":"string",
	 * "content":"string" } ], "files":[ { "name":"string", "body":"string" } ],
	 * "reserveTime": "yyyy-MM-dd HH:mm", "reserveTimeZone": "string",
	 * "scheduleCode": "string" }
	 */
	public void sendSMS(SendSmsVO bag2) {
		String hostNameUrl = "https://sens.apigw.ntruss.com"; // 호스트 URL
		String requestUrl = "/sms/v2/services/"; // 요청 URL
		String requestUrlType = "/messages"; // 요청 URL
		String accessKey = "FO9N7mZPhZWaosnVE1Gy"; // 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키 // Access Key :
													// https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key
													// ID
		String secretKey = "ZYLuRkbwx56Lqwr5hGzkS3mFu2TaVnhNQE2ozsLV"; // 2차 인증을 위해 서비스마다 할당되는 service secret key //
																		// Service Key :
																		// https://www.ncloud.com/mypage/manage/info >
																		// 인증키 관리 > Access Key ID
		String serviceId = "ncp:sms:kr:307905538600:matzip"; // 프로젝트에 할당된 SMS 서비스 ID // service ID :
																// https://console.ncloud.com/sens/project > Simple &
																// ... > Project > 서비스 ID
		String method = "POST"; // 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); // current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;

		// 이미지 파일 경로
		String imgPath = bag2.getImg();
		System.out.println(imgPath);

		try {
			// 이미지 파일을 읽어들여 바이트 배열로 변환
			byte[] fileContent = Files.readAllBytes(Paths.get(imgPath));

			// 바이트 배열을 Base64 문자열로 인코딩
			String encodedString = Base64.getEncoder().encodeToString(fileContent);

			// 파일 배열을 본문 JSON에 추가

			// JSON 을 활용한 body data 생성
			JSONObject bodyJson = new JSONObject();
			JSONObject toJson = new JSONObject();
			JSONArray toArr = new JSONArray();

			bodyJson.put("files",
					new JSONArray().put(new JSONObject().put("name", "image.jpg").put("body", encodedString)));

			// toJson.put("subject",""); // Optional, messages.subject 개별 메시지 제목, LMS,
			// MMS에서만 사용 가능
			// toJson.put("content","sms test in spring 111"); // Optional, messages.content
			// 개별 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
			toJson.put("to", "01050068537"); // Mandatory(필수), messages.to 수신번호, -를 제외한 숫자만 입력 가능
			toArr.put(toJson);

			bodyJson.put("type", "MMS"); // Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
			// bodyJson.put("contentType",""); // Optional, 메시지 내용 Type (AD | COMM) * AD:
			// 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가
			// 적용됩니다.
			// bodyJson.put("countryCode","82"); // Optional, 국가 전화번호, (default: 82)
			bodyJson.put("from", "01050068537"); // Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능
			// bodyJson.put("subject",""); // Optional, 기본 메시지 제목, LMS, MMS에서만 사용 가능
			bodyJson.put("content", "기프티콘 TEST"); // Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
			bodyJson.put("messages", toArr); // Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개

			// String body = bodyJson.toJSONString();
			String body = bodyJson.toString();

			System.out.println(body);

			URL url = new URL(apiUrl);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			con.setRequestProperty("x-ncp-apigw-signature-v2",
					makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
			con.setRequestMethod(method);
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());

			wr.write(body.getBytes());
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" + " " + responseCode);
			if (responseCode == 202) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println(response.toString());

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
