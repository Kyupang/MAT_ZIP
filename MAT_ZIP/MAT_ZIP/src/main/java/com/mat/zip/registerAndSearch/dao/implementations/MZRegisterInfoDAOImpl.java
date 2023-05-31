package com.mat.zip.registerAndSearch.dao.implementations;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mat.zip.registerAndSearch.dao.MZRegisterInfoDAO;
import com.mat.zip.registerAndSearch.model.MZRegisterInfoVO;


@Component
public class MZRegisterInfoDAOImpl implements MZRegisterInfoDAO {
	// DI
	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public int countInfoInMZ(MZRegisterInfoVO bag) {
		int result = my.selectOne("mzRegisterInfo.countInfoInMZ", bag);
		return result;
	}
	
	@Override
	public int insert(MZRegisterInfoVO bag) {
		int result = my.insert("mzRegisterInfo.create", bag);
		return result;
	}
	
	@Override
	public List<MZRegisterInfoVO> idInfoList(String userID) {
		List<MZRegisterInfoVO> result = my.selectList("mzRegisterInfo.idInfoAll",userID);
		return result;
	}
	
	@Override
	public List<String> getBuyTimes(String userID) {
		List<String> result = my.selectList("getBuyTimes",userID);
		return result;
	}
	
	@Override
	public int getRecordCountByBuyTime(String buyTime) {
		int result = my.selectOne("mzRegisterInfo.getRecordCountByBuyTime", buyTime);
		return result;
	}
	
	// 추후 관리를 위한 CRUD 코드
	@Override
	public int delete(int no) {
		int result = my.delete("del", no);
		return result;
	}
	
	@Override
	public int selectOne(String userID) {
		int result = my.selectOne("mzRegisterInfo.sel", userID);
		return result;

	}
	@Override
	public List<MZRegisterInfoVO> list() {
		List<MZRegisterInfoVO> result = my.selectList("mzRegisterInfo.all");
		return result;
	}
	//

	

	
}
