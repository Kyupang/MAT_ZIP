package com.mat.zip.registerAndSearch.dao;

import java.util.List;

import com.mat.zip.registerAndSearch.model.MZRegisterInfoVO;

public interface MZRegisterInfoDAO {

	int countInfoInMZ(MZRegisterInfoVO bag);
	
	int insert(MZRegisterInfoVO bag);
	
	List<MZRegisterInfoVO> idInfoList(String userID);
	
	List<String> getBuyTimes(String userID);
	
	public int getRecordCountByBuyTime(String buyTime);
	
	int selectOne(String userId);
	
	int delete(int no);
	
	List<MZRegisterInfoVO> list();
	


}