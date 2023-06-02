package com.mat.zip.mzMember.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mat.zip.mzMember.model.MzMemberDTO;
import com.mat.zip.mzMember.service.MzMemberserviceImpl;

@Controller
@RequestMapping("mz_member/*")
public class MzJoinController {
	
	//콘솔에 띄울 정보
	private static final Logger logger = LoggerFactory.getLogger(MzJoinController.class);
	
	@Inject
	MzMemberserviceImpl service;
	
	/** 메인페이지 -> 회원가입 경로 맵핑 */
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public void signUpPath(MzMemberDTO dto) throws Exception {
	}
	
	/** 회원가입 
	 * model에 작성한 정보 저장(memberDTO로)
	 * 만약 유효성 검사 중 어긋나는 것이 생기면 서비스 측에서 핸들링하고 그 결과를 map에 저장
	 * 저장한 결과를 model에 저장 후 포워딩 
	 * 어긋나지 않았다면 회원가입을 진행하고 리다이렉션 */
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUp(@Valid MzMemberDTO dto, Errors errors, Model model) throws Exception{
		//작성한 정보 유지
		model.addAttribute("memberDTO", dto);
		
		//유효성 검사 실패
		if (errors.hasErrors()) {
			
			Map<String, String> validatorResult = MzMemberserviceImpl.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			} //for문
			
			logger.info("유효성 검사 중 에러 발생");
			System.out.println(model);
			return "/mz_member/signUp";
		}
		
		logger.info("회원가입 post 요청");
		service.signUp(dto);
		
		return "redirect:/mz_member/login";
	}
	
	/** 이메일 인증 */
	@RequestMapping(value = "mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		logger.info("이메일 인증 요청이 들어옴");
		logger.info("인증 진행 메일: " + email);
		return service.authEmail(email);
	}
	
}
