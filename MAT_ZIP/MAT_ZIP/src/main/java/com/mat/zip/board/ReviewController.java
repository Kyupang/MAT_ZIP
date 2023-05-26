package com.mat.zip.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mat.zip.mzMember.model.MzMemberDTO;
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

		List<MZRegisterReceiptDTO> receiptList = reviewService.getReceiptWithRestaurant(user_id);
		
		if (receiptList.isEmpty()) {
			System.out.println("receiptList is empty");
			model.addAttribute("noReceipt", "리뷰를 작성할 영수증이 없습니다.");
		} else {
			System.out.println("receiptList is not empty, size: " + receiptList.size());
//			If you want to print every element in the list
//			for (MZRegisterReceiptDTO receipt : receiptList) {
//				System.out.println(receipt);
//			}
		}
		
		model.addAttribute("receiptList", receiptList);
		
		return "board/writeReview";
	}
	
	// insertReview 페이지로 이동하는 메소드
    @GetMapping("/beforeInsertReview")
    public String beforeInsertReview(@RequestParam("receipt_id") int receipt_id, Model model, HttpSession session) {

    	String user_id = (String) session.getAttribute("user_id");
        if (user_id == null) {
            // 사용자가 로그인하지 않은 경우 로그인 페이지로 리다이렉션합니다.
            return "redirect:/login";
        }

        // String user_id = member.getUser_id();

        List<MZRegisterReceiptDTO> receiptList = reviewService.getReceiptWithRestaurant(user_id);
        MZRegisterReceiptDTO selectedReceiptDTO = null;
        for(MZRegisterReceiptDTO receipt : receiptList) {
            if(receipt.getMzRegisterInfoVO().getNo() == receipt_id) {
                selectedReceiptDTO = receipt;
                break;
            }
        }

        model.addAttribute("receiptList", receiptList);
        model.addAttribute("receipt", selectedReceiptDTO); // 선택된 영수증 정보를 추가

        return "board/insertReview";
    }
	
    // 게시물 insert 처리 
    @PostMapping("/insertReview")
    public String insertReview(@ModelAttribute("review") ReviewVO vo,
            @RequestParam("receipt_id") int receipt_id,
            HttpServletRequest request,
            HttpServletResponse response,
            HttpSession session) throws Exception {

    	String user_id = (String) session.getAttribute("user_id");
        if (user_id == null) {
            // 사용자가 로그인하지 않은 경우 로그인 페이지로 리다이렉션합니다.
            return "redirect:/login";
        }
        vo.setUser_id(user_id);
        
        vo.setReceipt_id(receipt_id); // 변환한 영수증 ID를 vo에 설정
        
        reviewService.insertReview(vo);
        return "board/insertReviewSuccess";
    }
    
    // 리뷰게시물 조회수 증가 
    @RequestMapping("incrementReviewViewCount")
    @ResponseBody
    public void incrementReviewViewCount(@RequestParam("review_id") int review_id) {
        System.out.println("조회수 증가 전");
        reviewService.incrementReviewViewCount(review_id);
        System.out.println("조회수 증가 완료");
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
