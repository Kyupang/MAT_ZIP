package com.mat.zip.point.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mat.zip.point.service.PointExchangeHistoryServiceImpl;

@Controller
public class PointExchangeHistoryController {

	@Autowired
	PointExchangeHistoryServiceImpl PointExchangeHistoryService;

	@RequestMapping("/point/exchange")
	public void exchange(String user_id,  int id) {

		PointExchangeHistoryService.exChange(user_id, id);
		
		PointExchangeHistoryService.useDetailHistory(user_id, id);
		
	}
}
