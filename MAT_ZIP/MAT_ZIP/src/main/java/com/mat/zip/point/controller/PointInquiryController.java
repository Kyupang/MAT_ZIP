package com.mat.zip.point.controller;

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

	@RequestMapping(value = "/pointinquiry", method = RequestMethod.POST)
	@ResponseBody
	public int pointinquiry(String user_id) {

		PointInquiryVO inquirypoint = dao.pointinquiryFind(user_id);
		int data = inquirypoint.getPoint();
		System.out.println(data);
		
		return data;

	}

}
