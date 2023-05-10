package com.mat.zip.boss;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

	@Controller
	public class Boss_memberController {
	    @Autowired
	    Boss_memberDAO dao;
	    @Autowired
	    MemberDAO dao2;
	    
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
	        MemberVO vo = dao2.login(bag);
	        
	        // Boss_member 테이블 로그인
	        Boss_memberVO bossBag = new Boss_memberVO();
	        bossBag.setUser_id(bag.getUser_id());
	        bossBag.setPassword(bag.getPassword());
	        Boss_memberVO bossVo = dao.login(bossBag);

	        // member 또는 boss 테이블 중 하나라도 로그인 성공 시
	        if (vo != null || bossVo != null) {
	            if (vo != null) {
	                // Member 로그인 성공 시, user_id와 nickName을 세션에 저장
	                session.setAttribute("member_id", vo.getUser_id());
	                session.setAttribute("nickName", vo.getNickName());
	            }

	            if (bossVo != null) {
	                // Boss_member 로그인 성공 시, boss_id를 세션에 저장
	                session.setAttribute("boss_id", bossVo.getUser_id());
	            }

	            // 로그인 성공 후 이전 페이지로 리다이렉트
	            String prevPage = (String) session.getAttribute("prevPage");
	            if (prevPage != null) {
	                return "redirect:" + prevPage;
	            } else {
	                // 이전 페이지 정보가 없는 경우, 기본 페이지로 리다이렉트
	                return "redirect:board2.jsp";
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
	        return "redirect:board2.jsp"; // 로그아웃 후 리다이렉트 될 페이지
	    }

	    
//	    @PostMapping("/boss/boss_login")
//	    public String boss_login(Boss_memberVO bag, HttpSession session, HttpServletRequest request,Model model) {
//	        System.out.println(bag + "login실행됨");
//	        Boss_memberVO vo = dao.login(bag);
//	        if (vo != null) {
//	            String referrer = request.getHeader("Referer");
//	            request.getSession().setAttribute("prevPage", referrer);
//	            session.setAttribute("boss_id", vo.getUser_id());
//	            return "redirect:board2.jsp";
//	        } else {
//	            model.addAttribute("msg", "로그인에 실패했습니다. 다시 시도해주세요.");
//	            return "redirect:boss_login.jsp";
//	        }
//	    }

	    @PostMapping("innerJoinAndInsert")
	    public void innerJoinAndInsert() {
	        dao.innerJoinAndInsert();
	    }
	}


	


//	@RequestMapping("owner_one")
//	public void one(String id, Model model) {
//		System.out.println("one요청됨.");
//		System.out.println(id);
//		Boss_memberVO bag = dao.one(id);
//		System.out.println(bag);
//		model.addAttribute("bag", bag);
//		// views아래까지 전달할 데이터를 model객체를 이용해서 속성으로 지정해주세요.
//
//	}


