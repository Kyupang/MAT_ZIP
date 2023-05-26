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
		//user_id로 세션에 저장한 값을 id로 저장
        String user_id = (String) session.getAttribute("user_id");
        System.out.println(user_id);
        

        //vo에 결과값을 넣고 
        //그 vo에 있는 포인트 데이터를 가지고 와서 정수로 넘기기
        //그 값을 리턴해서 mypage로 가져감
		PointInquiryVO inquirypoint = dao.pointinquiryFind(user_id);
		System.out.println(inquirypoint);
		int data = inquirypoint.getPoint();
		System.out.println(data);
		return data;

	}

}
