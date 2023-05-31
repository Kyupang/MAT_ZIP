package com.mat.zip.registerAndSearch.service;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import software.amazon.awssdk.core.ResponseBytes;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.GetObjectResponse;


@Service
public class OCRGeneralAPI {
    @Autowired
    MZRegularExpression regEx;

    private String bucketName = "my-s3-gyu";

    private S3Client s3Client = S3Client.builder()
            .region(Region.AP_NORTHEAST_2)  // 사용하는 AWS 리전으로 변경해야 합니다.
            .build();

    public List<String> OCRAPI(String imagePath) {

        // 이미지 파일을 S3에서 다운로드
        GetObjectRequest getObjectRequest = GetObjectRequest.builder()
                .bucket(bucketName)
                .key(imagePath)
                .build();
        ResponseBytes<GetObjectResponse> responseBytes = s3Client.getObjectAsBytes(getObjectRequest);
        ByteBuffer imageBytes = responseBytes.asByteBuffer();

        String apiURL = "https://f1ohx0ypx2.apigw.ntruss.com/custom/v1/22051/8c2c8f8be327e59d5e0261d6fc8d7fadf5c2e85d31657e897e5149913eab86c0/general";
        String secretKey = "elNqY1REb0ZBWGRtTkNCTFpXdEV6U0ZvVlBuS3BZS0Y=";
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
            writeMultiPart(wr, postParams, imageBytes, boundary);
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

            //데이터 파싱
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
                list.add(inferText);

                resultStr += inferText + " ";
            }
            System.out.println("ocr_resultStr>> "+ resultStr);


            // 정규식으로 데이터를 추출한다.
            // 지번주소, 번지주소, 가게번호, 결제 일시
            regResultStr = regEx.MZRegularExpress(resultStr);
            System.out.println(resultStr);

            return regResultStr;
        } catch (Exception e) {
            System.out.println(e);
        }

        s3Client.close();
        return regResultStr;
    }


    private static void writeMultiPart(OutputStream out, String jsonMessage, ByteBuffer imageBytes, String boundary)
            throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append("--").append(boundary).append("\r\n");
        sb.append("Content-Disposition: form-data; name=\"message\"\r\n\r\n");
        sb.append(jsonMessage);
        sb.append("\r\n");

        out.write(sb.toString().getBytes("UTF-8"));
        out.flush();

        if (imageBytes != null) {
            out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
            StringBuilder fileString = new StringBuilder();
            fileString.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n");
            fileString.append("Content-Type: application/octet-stream\r\n\r\n");
            out.write(fileString.toString().getBytes("UTF-8"));
            out.flush();

            byte[] buffer = new byte[8192];
            while (imageBytes.hasRemaining()) {
                int count = Math.min(imageBytes.remaining(), buffer.length);
                imageBytes.get(buffer, 0, count);
                out.write(buffer, 0, count);
            }
            out.write("\r\n".getBytes());

            out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
        }
        out.flush();
    }
}