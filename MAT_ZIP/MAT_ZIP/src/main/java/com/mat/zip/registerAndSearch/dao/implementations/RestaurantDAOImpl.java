package com.mat.zip.registerAndSearch.dao.implementations;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mat.zip.registerAndSearch.dao.RestaurantDAO;
import com.mat.zip.registerAndSearch.model.MZRegisterInfoVO;
import com.mat.zip.registerAndSearch.model.RegistedAddressAndNameVO;


@Component
public class RestaurantDAOImpl implements RestaurantDAO {
	@Autowired
	// DI
	SqlSessionTemplate my;

	@Override
	public int countInfoInRestaurant(MZRegisterInfoVO bag) {
		int result = my.selectOne("countInfoInRestaurant", bag);
		return result;
	}
	
	@Override
	public RegistedAddressAndNameVO addressAndName(MZRegisterInfoVO bag) {
		RegistedAddressAndNameVO result = my.selectOne("addressAndName", bag);
		return result;
	}

	@Override
	public List<RegistedAddressAndNameVO> addressesAndNames() {
		List<RegistedAddressAndNameVO> result = my.selectList("addressesAndNames");
		return result;
	}
	
	
}
