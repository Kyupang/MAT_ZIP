package com.mat.zip.register;

import java.io.BufferedReader;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class OCRGeneralAPI {

	public List<String> OCRAPI(String imagePath) {
		String apiURL = "https://f1ohx0ypx2.apigw.ntruss.com/custom/v1/22051/8c2c8f8be327e59d5e0261d6fc8d7fadf5c2e85d31657e897e5149913eab86c0/general";
		String secretKey = "c2NJZHNVZ0ppd0ZzVVBkQ05ucGRXVkZxeVRETkxGT1c=";
		String imageFile = imagePath;
		List<String> regResultStr = null;

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.add(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
//////////////////////////////////////////////////////////////////////////////////////////////
//			System.out.println(response);
			org.json.simple.parser.JSONParser parser = new org.json.simple.parser.JSONParser();

			org.json.simple.JSONObject jsonResult2 = (org.json.simple.JSONObject) parser.parse(response.toString());
			org.json.simple.JSONArray images2 = (org.json.simple.JSONArray) jsonResult2.get("images");
			org.json.simple.JSONObject imageOne = (org.json.simple.JSONObject) images2.get(0);
			org.json.simple.JSONArray fields = (org.json.simple.JSONArray) imageOne.get("fields");
			ArrayList<String> list = new ArrayList<>();
			String resultStr = "";
			for (int i = 0; i < fields.size(); i++) {
				org.json.simple.JSONObject fields_one = (org.json.simple.JSONObject) fields.get(i);
				String inferText = (String) fields_one.get("inferText");
//				System.out.print(inferText + " ");
				list.add(inferText);

				resultStr += inferText + " ";
			}
//			System.out.println("ocr_result>> "+ list);
//			System.out.println("ocr_resultStr>> "+ resultStr);

			// result List ìëë¤.
			regResultStr = KoreaAddressExtractor(resultStr);
//			System.out.println(resultStr);

			System.out.println("jibun : " + regResultStr.get(0));
			System.out.println("doro myung : " + regResultStr.get(1));

//////////////////////////////////////////////////////////////////////////////////////		
			return regResultStr;
		} catch (Exception e) {
			System.out.println(e);
		}

		return regResultStr;
	}

	private static List<String> KoreaAddressExtractor(String resultStr) {
		String address = resultStr;

		// 지번주소
		String regex = "(([가-힣]+(시|도)?|[서울]|[인천]|[대구]|[광주]|[부산]|[울산])( |))" // 그룹1
				+ "([가-힣]+(시|군|구)( |))" // 그룹5
				+ "(([가-힣]+(d|d(,|.)d|)+(로|읍|면|동|가|리)(\\d+)?(가)?)( |)?)"// 그룹8
				+ "(\\d{1,4}-?\\d{1,4}( |)?)"; // 그룹14

		String newRegex = "(([가-힣]+(시|도)?|[서울]|[인천]|[대구]|[광주]|[부산]|[울산])( |))" // 그룹1
				+ "([가-힣]+(시|군|구)( |))" // 그룹5
				+ "([가-힣]+(로|동|길)(\\d+)?(길|번길)?( |)?)" // 그룹8,9,10
				+ "(\\d{1,4}( |)?)" + "((-|~)?(\\d+)?( |)?)";

		Matcher matcher = Pattern.compile(regex).matcher(address);
		Matcher newMatcher = Pattern.compile(newRegex).matcher(address);

		List<String> result = new ArrayList<>();
		String jibun = "";
		String doro = "";
		if (matcher.find()) {
			// System.out.println(matcher.group());
			jibun = matcher.group();
		} else {
			//System.out.println("안돼용~1");
			jibun = "안돼용~1";
		}
		if (newMatcher.find()) {
			// System.out.println(newMatcher.group());
			doro = newMatcher.group();
		} else {
			//System.out.println("안돼용~2");
			doro = "안돼용~2";
		}

		result.add(jibun);
		result.add(doro);

		return result;
	}

	
	
	
	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
			throws IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}

}