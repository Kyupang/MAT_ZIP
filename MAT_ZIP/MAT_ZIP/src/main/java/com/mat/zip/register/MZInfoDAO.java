package com.mat.zip.register;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class MZInfoDAO {
	@Autowired
	// DI
	SqlSessionTemplate my;

	public int insert(MZInfoVO bag) {
		int result = my.insert("mzInfo.create", bag);
		return result;
	}

	public int delete(int no) {
		int result = my.delete("del", no);
		return result;
	}

	public int update(MZInfoVO bag) {
		int result = my.update("mzInfo.up", bag);
		return result;

	}

	public MZInfoVO select_one(String address) {
		MZInfoVO result = my.selectOne("mzInfo.sel", address);
		return result;
	}

	public List<MZInfoVO> list() {
		List<MZInfoVO> result = my.selectList("mzInfo.all");
		return result;

	}
	
	public int countByIdAndAddress(MZInfoVO bag) {
		int result = my.selectOne("mzInfo.countByIdAndAddress", bag);
		return result;
	}
	
}
