package com.mat.zip.point;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PointSaveHistoryDAO {

	@Autowired
	SqlSessionTemplate point;
	
	public void InsertPoint(PointSaveHistoryVO bag2) {
		point.insert("point.insert", bag2);
	}
	
	public void detailpointinsert(PointSaveHistoryVO bag2) {
		point.insert("point.detailinsert", bag2);
	}
}
