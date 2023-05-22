package com.mat.zip.point.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mat.zip.point.dao.PointSaveHistoryDAO;
import com.mat.zip.point.model.PointSaveHistoryVO;

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
