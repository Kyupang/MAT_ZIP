package com.mat.zip.point.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mat.zip.point.model.PointDetailHistoryVO;
import com.mat.zip.point.model.PointExchangeHistoryVO;
import com.mat.zip.point.model.PointSaveHistoryVO;
import com.mat.zip.point.model.ProductPointVO;



@Component
public class PointExchangeHistoryDAO {

	@Autowired
	SqlSessionTemplate point;
	
	public void usepointinsert(PointExchangeHistoryVO bag) {
		point.insert("usepoint.insert", bag);
	}
	
	public PointSaveHistoryVO pointsaveFind(String user_id) {
		return point.selectOne("usepoint.one", user_id);
	}
	
	public ProductPointVO productPointFind(int id) {
		return point.selectOne("product.one", id);
	}
	
	public List<PointSaveHistoryVO> pointsaveFindAll(String user_id) {
		return point.selectList("usepoint.all", user_id);
	}
	
	public void usedetailpointinsert(PointDetailHistoryVO detailhistory) {
		point.insert("usepoint.usedetailinsert", detailhistory);
	}
}
