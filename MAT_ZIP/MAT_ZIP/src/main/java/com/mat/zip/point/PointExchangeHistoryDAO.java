package com.mat.zip.point;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



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
