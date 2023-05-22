package com.mat.zip.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointSaveHistoryServiceImpl implements PointSaveHistoryService{

	@Autowired
	PointSaveHistoryDAO pointSaveHistoryDAO;
	
	@Override
	public void addPoint(PointSaveHistoryVO bag2) {
		
		pointSaveHistoryDAO.InsertPoint(bag2);
		
		pointSaveHistoryDAO.detailpointinsert(bag2);
	}
	
}
