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
		System.out.println(list);
		model.addAttribute("list", list);

	}

}