package com.mat.zip.mzMember.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mat.zip.boss.dao.Boss_memberDAO;
import com.mat.zip.boss.model.Boss_memberVO;
import com.mat.zip.mzMember.model.KakaoLoginBO;
import com.mat.zip.mzMember.model.MzMemberDTO;
import com.mat.zip.mzMember.model.NaverLoginBO;
import com.mat.zip.mzMember.service.JsonParser;
import com.mat.zip.mzMember.service.MzMemberserviceImpl;

@Controller
@RequestMapping("mz_member/*")
public class MzMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MzMemberController.class);
	private KakaoLoginBO kakaoLoginBO;
	private NaverLoginBO naverLoginBO;
	
	@Inject
	MzMemberserviceImpl service;
	
	@Autowired
	Boss_memberDAO dao;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	/* 카카오 의존성 주입 */
	@Autowired
	private void setKakaoLoginBO(KakaoLoginBO kakaologinBO) {
		this.kakaoLoginBO = kakaologinBO;
	}
	
	/** 이메일 인증 */
	@RequestMapping(value = "mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		logger.info("이메일 인증 요청이 들어옴");
		logger.info("인증 진행 메일: " + email);
		return service.authEmail(email);
	}
	
	/** 메인 페이지에서 로그인 페이지 넘어가는 경로 맵핑, 네이버 아이디 인증 url 생성 메서드 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginPage(HttpSession session, Model model, String url) {
		
		/* naverLogin 클래스의 네아로 인증 url 생성하는 메서드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationURL(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		logger.info("naver url: " + naverAuthUrl);
		
		/* kakaoLoginBO 클래스의 카카오 로그인 인증 url 생성하는 메서드 호출 */
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationURL(session);
		model.addAttribute("kakaoUrl", kakaoAuthUrl);
		logger.info("kakao url: " + kakaoAuthUrl);
		
		return "/mz_member/login";
	}
	
	/** 로그인 
	 * 세션에 값 부여하고 회원이 유효한지 확인 후
	 * 유효하지 않으면 (0이라면) 세션 값에 null 넣고 메세지에 miss 넣어서 값 전달
	 * 유효하다면 회원 정보를 가져와서 세션에 넣고 메인페이지로 리다이렉션 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginTest(MzMemberDTO dto, HttpServletRequest request, RedirectAttributes rttr, HttpSession session) throws Exception {
		logger.info("로그인 실행");
		
		int loginResult = service.memberLogin(dto);
		
		if (loginResult == 0) {
			logger.info("로그인 실패");
			session.setAttribute("memberInfo", null);
			 rttr.addFlashAttribute("msg", "miss"); //리다이렉트 필요
			 
			 return "redirect:/mz_member/login";
		} else {
			logger.info("로그인 성공");
			MzMemberDTO memberInfo = service.getMemberInfo(dto.getUser_id());
			
			logger.info("회원 정보 가져옴");
			session.setAttribute("user_id", memberInfo.getUser_id());
			
			Boss_memberVO bossBag = new Boss_memberVO();
			bossBag.setUser_id(dto.getUser_id());
			bossBag.setPassword(dto.getPassword());
			
	        if(dao.login(bossBag) != null) {
		        // Boss_member 테이블 로그인
		        bossBag.setUser_id(dto.getUser_id());
		        bossBag.setPassword(dto.getPassword());
		        Boss_memberVO bossVo = dao.login(bossBag);
		        
		        //멤버 vo의 아이디와 boss vo의 아이디가 같으면 if문 실행
		        if(dto.getUser_id().equals(bossVo.getUser_id()) && bossVo != null) {
		                // Boss_member 로그인 성공 시, boss_id와 store_id를 세션에 저장
		                session.setAttribute("boss_id", bossVo.getUser_id());
		                session.setAttribute("store_id", bossVo.getStore_id());
		        }
	        }
			return "redirect:/index.jsp";
		}
	}
	
	/* 네이버 로그인 성공 시 호출하는 callback 메서드 */
	@RequestMapping(value = "callbackNaver", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginPostNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, MzMemberDTO dto) throws Exception{
		logger.info("callback controller 실행");
		JsonParser json = new JsonParser();
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		dto = json.changeJson(apiResult);
		
		System.out.println(dto.getUser_id());
//		int loginResult = service.memberLogin(dto);
//		if (loginResult == 0) {
//			logger.info("간편 로그인 유저 회원가입");
//			 
//			 return "/mz_member/callbackNaver";
//		}
		
		//윗부분에 if문 써서 db에 count해서 정보가 없다면 위에 껄 실행해서 추가하고, 아니면 그냥 냅두는 형식
		//if()
		
		session.setAttribute("user_id", dto.getUser_id());
		System.out.println(model);
		return "/mz_member/callbackNaver";
	}
	
	/* 카카오 로그인 성공 시 콜백 메서드 */
	@RequestMapping(value = "callbackKakao", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		logger.info("카카오 로그인 콜백 성공");
		//JsonParser json = new JsonParser();
		
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state); 
		String apiResult = kakaoLoginBO.getUserProfile(oauthToken);
		System.out.println(apiResult);
		
		//json.changeJson(apiResult);
		
		model.addAttribute("memberInfo", apiResult);
		System.out.println(model);
		
		return "/mz_member/callbackKakao";
	}
	
	
	/** 로그아웃 
	 * 로그아웃 실행 시에 세션 무효화하고 메인페이지로 리다이렉션 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logOut(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
	/** 마이페이지 맵핑 */
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String memberInfo(MzMemberDTO dto, HttpSession session, Model model) throws Exception {
		String id = String.valueOf(session.getAttribute("user_id"));
		
		MzMemberDTO memberInfo = service.getMemberInfo(id);
		model.addAttribute("memberInfo", memberInfo);
		
		return "/mz_member/myPage";
	}
	
	/** 회원 정보 수정 맵핑 */
	@RequestMapping(value = "changeInfo", method = RequestMethod.GET)
	public void changeInfo() {
	}
	
}
