package com.mat.zip.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;

import com.mat.zip.registerAndSearch.model.MZRegisterInfoVO;

@Controller
@RequestMapping("/board/*")
public class ReviewController {
	
	private static Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	
	// writeReview 페이지로 이동하는 메소드
	@GetMapping("/writeReview")
	public String writeReview(Model model, HttpSession session) {
	    String user_id = (String) session.getAttribute("user_id");
	    if (user_id == null) {
	        // 사용자가 로그인하지 않은 경우 로그인 페이지로 리다이렉션합니다.
	        return "redirect:/login";
	    }
	    List<MZRegisterInfoVO> receiptList = reviewService.getReceipt(user_id);
	    model.addAttribute("receiptList", receiptList);
	    return "board/writeReview";
	}
	
	
	// insertReview 페이지로 이동하는 메소드
	@PostMapping("/insertReview")
	public String insertReview(ReviewVO vo, HttpSession session) {
	    String user_id = (String) session.getAttribute("user_id");
	    if (user_id == null) {
	        // 사용자가 로그인하지 않은 경우 로그인 페이지로 리다이렉션합니다.
	        return "redirect:/login";
	    }
	    vo.setUser_id(user_id);
	    reviewService.insertReview(vo);
	    return "redirect:/boardReview";
	}
	
	
//	// 게시물 insert 처리 
//	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
//	public String insert(ReviewVO vo, RedirectAttributes redirectAttributes) {
//		
//		logger.info("insert Review...");
//		logger.info(vo.toString());
//		reviewService.insertReview(vo);
//		redirectAttributes.addFlashAttribute("msg", "insertSuccess");
//		
//		return "redirect:/board/allReview";
//	}
	

	// 리뷰게시물 전체 게시글 list 
	@RequestMapping(value = "/allReview", method = RequestMethod.GET)
	public String allReview(Model model) {
		
		logger.info("allReview...");
		model.addAttribute("review", reviewService.allReview());
		
		return "/board/allReview";
	}
	
	
	// 게시물 상세 정보 조회 (oneReviewId) 페이지로 이동 
	@RequestMapping(value = "/oneReviewId", method = RequestMethod.GET)
	public String oneReviewId(int review_id, Model model) {
		
		logger.info("oneReviewId...");
		
		ReviewVO vo = reviewService.oneReviewId(review_id); // review_id값을 넘김
		
		System.out.println(vo);
		model.addAttribute("data", vo);
		
		return "/board/oneReviewId";
	}
	
	
	// 수정 페이지로 이동 
	@RequestMapping(value = "/updateReview", method = RequestMethod.GET)
	public String updateGet(@RequestParam("review_id") int review_id, Model model) {
		
		logger.info("updateGet...");
		model.addAttribute("review", reviewService.oneReviewId(review_id));
		
		return "/board/updateReview";
	}
	
	
	// 게시물 수정 처리 
	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	public String update(ReviewVO vo, RedirectAttributes redirectAttributes) {
		
		logger.info("update Review...");
		reviewService.update(vo);
		redirectAttributes.addFlashAttribute("msg", "updateSuccess");
		
		return "redirect:/board/allReview";
	}
	
	
	// 게시물 삭제 처리 
	@RequestMapping(value = "/deleteReview", method = RequestMethod.POST)
	public String delete(@RequestParam("review_id") int review_id, RedirectAttributes redirectAttributes) {
		
		logger.info("delete Review...");
		reviewService.delete(review_id);
		redirectAttributes.addFlashAttribute("msg", "deleteSuccess");
		
		return "redirect:/board/allReview";
		
	}

}
