package com.mat.zip.mainpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class RestaurantController {
	
	@Autowired
	RestaurantDAO dao; 
	
	@RequestMapping("insert")
	public void insert(RestaurantVO bag) {
		System.out.println(bag);
		dao.insert(bag);
	}
	
	
	@RequestMapping("one")
	public void one(String id, Model model) {
		System.out.println(id);
		RestaurantVO vo = dao.one(id);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("list")
	public void list(Model model) {
		List<RestaurantVO> list = dao.list();
		//views아래까지 전달할 데이터를 model객체를 이용해서
		//속성으로 지정해주세요.
		model.addAttribute("list", list); //속성으로 지정
	}
}