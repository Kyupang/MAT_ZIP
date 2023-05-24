package com.mat.zip.point.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mat.zip.point.model.gifticonVO;

@Component
public class gifticonDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<gifticonVO> findall() {
		return my.selectList("gifticon.findall");
	}

}
