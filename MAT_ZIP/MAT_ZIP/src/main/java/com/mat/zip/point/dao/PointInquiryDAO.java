package com.mat.zip.point.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mat.zip.point.model.PointInquiryVO;
import com.mat.zip.point.model.PointSaveHistoryVO;

@Component
public class PointInquiryDAO {

	@Autowired
	SqlSessionTemplate point;

	public PointInquiryVO pointinquiryFind(String user_id) {
		return point.selectOne("pointinquiry.find", user_id);
	}
	
	public List<PointSaveHistoryVO> pointhistoryAll(String user_id) {
		return point.selectList("pointinquiry.all", user_id);
	}

}
