package com.mat.zip.point.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mat.zip.point.dao.PointInquiryDAO;
import com.mat.zip.point.model.PointInquiryVO;

@Controller
public class PointInquiryController {

	@Autowired
	PointInquiryDAO dao;

	@RequestMapping(value = "/point/pointinquiry", method = RequestMethod.POST)
	@ResponseBody
	public int pointinquiry(HttpServletRequest request) {
		
		//String user_id = (String) request.getSession().getAttribute("user_id");
		//이것도 사용 가능하네 개인적인 가독성으로 밑에 코드를 선택
		HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");

		PointInquiryVO inquirypoint = dao.pointinquiryFind(user_id);
		int data = inquirypoint.getPoint();
		System.out.println(data);
		
		return data;

	}

}
