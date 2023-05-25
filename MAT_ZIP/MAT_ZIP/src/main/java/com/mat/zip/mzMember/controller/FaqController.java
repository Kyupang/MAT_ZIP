package com.mat.zip.mzMember.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FaqController {
	
	@RequestMapping(value = "mz_member/faq", method = RequestMethod.GET)
	public void name() {
		System.out.println("faq요청");
	}
}
