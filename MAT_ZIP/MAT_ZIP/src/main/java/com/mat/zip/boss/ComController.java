package com.mat.zip.boss;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComController {

	@Autowired
	ComDAO dao;

	// 댓글 등록
	@RequestMapping("/boss/Board_insertcom")
	public void insert(ComVO bag, int board_id, Model model) {
		List<ComVO> list = dao.list(board_id);
		System.out.println("insert요청됨.");
		System.out.println(bag);
		model.addAttribute("Com_list", list);
		dao.insert(bag);
	}

	// 댓글 수정
	@RequestMapping("/boss/Com_update")
	public void update(ComVO bag, HttpSession session) {
		String currentUserId = (String) session.getAttribute("user_id");
		ComVO existingComment = dao.one(bag.getReply_id());
		if (currentUserId.equals(existingComment.getWriter())) {
			System.out.println("update요청됨.");
			System.out.println(bag);
			dao.update(bag);
		} else {
			// 현재 사용자가 댓글 작성자와 일치하지 않는 경우 예외를 발생시킵니다.
			throw new RuntimeException("Only the original author can edit the comment.");
		}
	}

	@RequestMapping("/boss/Com_delete")
	public void delete(int reply_id, HttpSession session) {
		String currentUserId = (String) session.getAttribute("user_id");
		ComVO existingComment = dao.one(reply_id);
		if (currentUserId.equals(existingComment.getWriter())) {
			System.out.println("delete요청됨.");
			System.out.println(reply_id);
			dao.delete(reply_id);
		} else {
			// 현재 사용자가 댓글 작성자와 일치하지 않는 경우 예외를 발생시킵니다.
			throw new RuntimeException("Only the original author can delete the comment.");
		}
	}



	@RequestMapping("Com_one")
	public void one(int Com_id, Model model) {
		System.out.println("one요청됨.");
		ComVO bag = dao.one(Com_id);
		System.out.println(bag);
		model.addAttribute("bag", bag);
	}
}