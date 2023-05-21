package com.mat.zip.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointSaveHistoryService {

	@Autowired
	PointSaveHistoryDAO pointSaveHistoryDAO;
	
	public void addPoint(PointSaveHistoryVO bag2) {
		pointSaveHistoryDAO.InsertPoint(bag2);
	}
	
}
