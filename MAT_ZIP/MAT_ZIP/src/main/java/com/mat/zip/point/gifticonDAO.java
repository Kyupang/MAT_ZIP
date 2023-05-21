package com.mat.zip.point;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class gifticonDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<gifticonVO> findall() {
		return my.selectList("gifticon.findall");
	}

}
