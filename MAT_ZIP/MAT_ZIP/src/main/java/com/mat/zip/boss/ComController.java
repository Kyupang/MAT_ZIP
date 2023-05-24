package com.mat.zip.boss;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller // 스프링에서 제어하는 역할로 등록!
public class ComController {

	@Autowired
	ComDAO dao;

	@RequestMapping("/boss/Board_insertcom")
	public void insert(ComVO bag, int board_id, Model model) {
		List<ComVO> list = dao.list(board_id);
		System.out.println("insert요청됨.");
		System.out.println(bag);
		model.addAttribute("Com_list", list);
		dao.insert(bag);
	}

	@RequestMapping("/boss/Com_update")
	public void update(ComVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
	}

	@RequestMapping("/boss/Com_delete")
	public void delete(int reply_id) {
		System.out.println("delete요청됨.");
		System.out.println(reply_id);
		dao.delete(reply_id);
	}

	@RequestMapping("Com_one")
	public void one(int Com_id, Model model) {
		System.out.println("one요청됨.");
		ComVO bag = dao.one(Com_id);
		System.out.println(bag);
		model.addAttribute("bag", bag);
	}
}