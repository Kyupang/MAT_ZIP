package com.mat.zip.point.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mat.zip.point.model.PointInquiryVO;

@Component
public class PointInquiryDAO {

	@Autowired
	SqlSessionTemplate point;

	public PointInquiryVO pointinquiryFind(String user_id) {
		return point.selectOne("pointinquiry.find", user_id);
	}

}
