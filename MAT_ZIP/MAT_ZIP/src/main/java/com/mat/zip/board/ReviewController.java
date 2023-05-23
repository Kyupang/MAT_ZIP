package com.mat.zip.board;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board/*")
public class ReviewController {
	
	private static Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	private ReviewService reviewService;
	
	@Inject
	public ReviewController(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
	
	// 게시물 insert 페이지로 이동하기 
	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertGet() {
		
		logger.info("insert GET...");
		
		return "/board/insertReview";
	}
	
	
	// 게시물 insert 처리 
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	public String insert(ReviewVO reviewVO, RedirectAttributes redirectAttributes) {
		
		logger.info("insert Review...");
		logger.info(reviewVO.toString());
		reviewService.create(reviewVO);
		redirectAttributes.addFlashAttribute("msg", "insertSuccess");
		
		return "redirect:/board/allReview";
	}
	
	
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
		
		ReviewVO data = reviewService.oneReviewId(review_id); // review_id값을 넘김
		
		System.out.println(data);
		model.addAttribute("data", data);
		
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
	public String update(ReviewVO reviewVO, RedirectAttributes redirectAttributes) {
		
		logger.info("update Review...");
		reviewService.update(reviewVO);
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
