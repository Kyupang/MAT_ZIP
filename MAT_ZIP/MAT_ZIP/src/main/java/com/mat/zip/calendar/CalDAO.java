package com.mat.zip.calendar;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class CalDAO { 
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<CalVO> schedule_list(){
		return mybatis.selectList("calendar.all");
	}
	
	public void add(CalVO calVO) {
		mybatis.insert("calendar.add", calVO);
	}
	
	public void update(CalVO calVO) {
		mybatis.update("calendar.up", calVO);
	}
	
	public void delete(int idx) {
		mybatis.delete("calendar.del", idx);
	}
	
	public CalVO one(int idx) {
		return mybatis.selectOne("calendar.one", idx);
	}
}


