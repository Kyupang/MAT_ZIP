package com.mat.zip.registerAndSearch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mat.zip.register.MixedWithTwoDBVO;
import com.mat.zip.registerAndSearch.dao.RestaurantDAO;
import com.mat.zip.registerAndSearch.model.RegistedAddressAndNameVO;

@Controller
@RequestMapping("/registerAndSearch/controller")
public class SearchController {
	
	@Autowired
	RestaurantDAO restaurantDAO;
	
	//검색 기능 자동완성 데이터 가져오기 and 검색 키워드 마커찍어주기 컨트롤러 기능 
		//지도 업데이트 버튼 관련 함수 
		@RequestMapping(value = {"/Remap.mz", "/autoComplete.mz", "/searchResultMarker.mz"})
		@ResponseBody // 요청을 받으면 return되는 데이터를 json으로 만들어서 요청하는 곳으로 다시 보냄,
		public List<RegistedAddressAndNameVO> search() {
			//일단 mz에 있는 주소 다 데려와. 
			//DB에 일치하는 주소와 name을 가져와서 RestaurantVO에 집어넣고 넘겨.
			List<RegistedAddressAndNameVO> result = restaurantDAO.addressesAndNames();
			
			return result;
		}
}
