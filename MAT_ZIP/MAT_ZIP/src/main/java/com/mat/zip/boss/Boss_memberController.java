package com.mat.zip.boss;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

	@Controller
	public class Boss_memberController {
	    @Autowired
	    Boss_memberDAO boss_memberDAO;
	    @Autowired
	    MemberDAO memberDAO;
	    
	    @GetMapping("/boss_login")
	    public String loginPage(HttpServletRequest request, HttpSession session) {
	        // 로그인 페이지에 접근하기 전의 페이지 URL을 세션에 저장
	        String referrer = request.getHeader("Referer");
	        session.setAttribute("prevPage", referrer);

	        // 로그인 페이지 뷰를 반환
	        return "boss_login";
	    }

	    @PostMapping("/boss/member_login")
	    public String member_login(MemberVO bag, HttpSession session, HttpServletRequest request, Model model) {
	        System.out.println(bag + "login실행됨");
	        
	        // Member 테이블 로그인
	        MemberVO vo = memberDAO.login(bag);
	        
	        // Boss_member 테이블 로그인
	        Boss_memberVO bossBag = new Boss_memberVO();
	        bossBag.setUser_id(bag.getUser_id());
	        bossBag.setPassword(bag.getPassword());
	        Boss_memberVO bossVo = boss_memberDAO.login(bossBag);

	        // member 또는 boss 테이블 중 하나라도 로그인 성공 시
	        if (vo != null || bossVo != null) {
	            if (vo != null) {
	                // Member 로그인 성공 시, user_id와 nickName을 세션에 저장
	                session.setAttribute("user_id", vo.getUser_id());
	                session.setAttribute("nickName", vo.getNickName());
	            }

	            if (bossVo != null) {
	                // Boss_member 로그인 성공 시, boss_id와 store_id를 세션에 저장
	                session.setAttribute("boss_id", bossVo.getUser_id());
	                session.setAttribute("store_id", bossVo.getStore_id());
	            }

	            // 로그인 성공 후 이전 페이지로 리다이렉트
	            String prevPage = (String) session.getAttribute("prevPage");
	            if (prevPage != null) {
	                return "redirect:" + prevPage;
	            } else {
	                // 이전 페이지 정보가 없는 경우, 기본 페이지로 리다이렉트
	                return "redirect:board_index.jsp";
	            }
	        } else {
	            model.addAttribute("msg", "로그인에 실패했습니다. 다시 시도해주세요.");
	            return "forward:boss_login.jsp";
	        }
	    }

	    @GetMapping("/boss/logout")
	    public String logout(HttpSession session) {
	        // 모든 세션 제거
	        session.invalidate();
	        return "redirect:board_index.jsp"; // 로그아웃 후 리다이렉트 될 페이지
	    }

	} 
	    
	    




