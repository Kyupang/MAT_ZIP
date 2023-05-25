package com.mat.zip.mainpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class MzlistController {
	
	@Autowired
	MzlistDAO dao; 
	
	
	@RequestMapping("mainpage/mzone")
	public void one(String landNumAddress, Model model) {
		System.out.println("-----------" +  landNumAddress);
		MzlistVO vo = dao.one(landNumAddress);
		model.addAttribute("vo", vo);
		System.out.println(vo);
	}
	
	
	@RequestMapping("mainpage/han.mz")
	public void han(String food,Model model) {
		System.out.println(food);
		List<MzlistVO> list = dao.han(food);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("mainpage/jjung.mz")
	public void jjung(String food,Model model) {
		System.out.println(food);
		List<MzlistVO> list = dao.jjung(food);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("mainpage/ill.mz")
	public void ill(String food,Model model) {
		System.out.println(food);
		List<MzlistVO> list = dao.ill(food);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("mainpage/gyung.mz")
	public void gyung(String food,Model model) {
		System.out.println(food);
		List<MzlistVO> list = dao.gyung(food);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("mainpage/boon.mz")
	public void boon(String food,Model model) {
		System.out.println(food);
		List<MzlistVO> list = dao.boon(food);
		model.addAttribute("list",list);
	}
	
}


