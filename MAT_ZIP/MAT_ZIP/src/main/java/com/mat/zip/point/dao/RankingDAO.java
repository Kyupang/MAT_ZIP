package com.mat.zip.point.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mat.zip.point.model.RankingVO;

@Component
public class RankingDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<RankingVO> findall() {
		return my.selectList("ranking.findall");
	}
	
	public List<RankingVO> findgenderman() {
		return my.selectList("ranking.findgenderman");
	}
	
	public List<RankingVO> findgenderwoman() {
		return my.selectList("ranking.findgenderwoman");
	}

}
