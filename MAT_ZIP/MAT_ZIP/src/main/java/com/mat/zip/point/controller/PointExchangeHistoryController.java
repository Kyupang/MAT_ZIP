package com.mat.zip.point.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mat.zip.point.service.PointExchangeHistoryServiceImpl;

@Controller
public class PointExchangeHistoryController {

	@Autowired
	PointExchangeHistoryServiceImpl PointExchangeHistoryService;

	@RequestMapping(value = "point/exchange", method = RequestMethod.POST)
	public void exchange(HttpServletRequest request,  int id) {
		
		HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");

		PointExchangeHistoryService.exChange(user_id, id);
		
		//PointExchangeHistoryService.useDetailHistory(user_id, id);
		
	}
}
