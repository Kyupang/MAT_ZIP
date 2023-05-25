package com.mat.zip.mzMember.service;

/* json 형식으로 넘어온 값을 parse(변환) 해주는 메서드
 * parse: 사용하는 프로그래밍 언어가 표현 언어(ex: json)를 그 데이터의 사용 형식으로 변경 */

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.mat.zip.mzMember.model.MzMemberDTO;

public class JsonParser {
	public MzMemberDTO changeJson(String str) throws Exception{
		
		//사용할 변수 선언
		HashMap<String, Object> map = new HashMap<String, Object>();
		JSONParser jsonParser = new JSONParser(); 
		MzMemberDTO dto = new MzMemberDTO();
		
		JSONObject jsonOb = (JSONObject) jsonParser.parse(str);
		JSONObject jsonObjcet = (JSONObject) jsonOb.get("response");
		
		String birthDate = jsonObjcet.get("birthyear") + "-" + jsonObjcet.get("birthday");
		String gender = changeGender(jsonObjcet.get("gender"));
		String age = (String) jsonObjcet.get("age");
		String ageGroup = age.substring(0, 1);
		
		map.put("user_id", jsonObjcet.get("email"));
		map.put("name", jsonObjcet.get("name"));
		map.put("gender", gender);
		map.put("birthDate", birthDate);
		map.put("ageGroup", ageGroup);
		map.put("phNum", jsonObjcet.get("mobile"));
		map.put("nickName", jsonObjcet.get("nickname"));
		map.put("profile", jsonObjcet.get("profile_image"));
		
		dto.setUser_id(map.get("user_id").toString());
		dto.setName(map.get("name").toString());
		dto.setGender(map.get("gender").toString());
		dto.setBirthDate(map.get("birthDate").toString());
		dto.setAgeGroup(map.get("ageGroup").toString());
		dto.setPhNum(map.get("phNum").toString());
		dto.setNickName(map.get("nickName").toString());
		dto.setProfile(map.get("profile").toString());
		
		System.out.println(map.toString());
		
		return dto;
	}
	
	//성별 변환 함수
	private String changeGender(Object gender) {
		String sex = "";
		
		if(gender.equals("F")) {
			sex = "여";
		} else if(gender.equals("M")) {
			gender = "남";
		} else {
			gender = " ";
		}
		
		return sex;
	}
}

