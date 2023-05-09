package com.mat.zip.register;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class RestaurantDAO {
	@Autowired
	// DI
	SqlSessionTemplate my;


	public RestaurantVO select_one(RestaurantVO bag) {
		RestaurantVO result = my.selectOne("Restaurant.sel", bag);
		return result;
	}

	public List<RestaurantVO> list() {
		List<RestaurantVO> result = my.selectList("Restaurant.all");
		return result;

	}
	public int countByAddressInRestaurant(MZInfoVO bag) {
		int result = my.selectOne("countByAddressInRestaurant", bag);
		return result;
	}
	
	public List<MixedWithTwoDBVO> addressAndName() {
		List<MixedWithTwoDBVO> result = my.selectList("addressAndName");
		return result;
	}
}
