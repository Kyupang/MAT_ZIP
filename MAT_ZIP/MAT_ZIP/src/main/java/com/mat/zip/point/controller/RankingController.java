package com.mat.zip.point.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mat.zip.point.dao.RankingDAO;
import com.mat.zip.point.model.RankingVO;

@Controller
@RequestMapping("point/*")
public class RankingController {

	@Autowired
	RankingDAO dao;

	@RequestMapping(value = "ranking", method = RequestMethod.GET)
	public void ranking(Model model) {
		List<RankingVO> list = dao.findall();
		System.out.println(list + "지역");
		model.addAttribute("list", list);

	}
	
	@RequestMapping(value = "rankingman", method = RequestMethod.GET)
	public void rankingman(Model model) {
		List<RankingVO> list = dao.findgenderman();
		System.out.println(list + "남");
		model.addAttribute("list", list);

	}
	
	@RequestMapping(value = "rankingwoman", method = RequestMethod.GET)
	public void rankingwoman(Model model) {
		List<RankingVO> list = dao.findgenderwoman();
		System.out.println(list + "여");
		model.addAttribute("list", list);

	}

}