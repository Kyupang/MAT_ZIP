package com.mat.zip.mainpage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RestaurantDAO { 
	
	@Autowired
	SqlSessionTemplate my; 
	
	public void insert(RestaurantVO bag) {
		my.insert("restaurant.create", bag);
	}
	
	
	public RestaurantVO one(String id) {
		RestaurantVO vo = my.selectOne("restaurant.one", id);
		System.out.println(vo);
		return vo;
	}
	
	public List<RestaurantVO> list() {
		List<RestaurantVO> list = my.selectList("restaurant.all"); 
		System.out.println(list.size());
		return list;
	}
	
}