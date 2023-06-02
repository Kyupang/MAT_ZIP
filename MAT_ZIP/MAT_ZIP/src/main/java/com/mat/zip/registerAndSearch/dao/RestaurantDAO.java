package com.mat.zip.registerAndSearch.dao;

import java.util.List;

import com.mat.zip.registerAndSearch.model.MZRegisterInfoVO;
import com.mat.zip.registerAndSearch.model.RegistedAddressAndNameVO;

public interface RestaurantDAO {

	int countInfoInRestaurant(MZRegisterInfoVO bag);

	RegistedAddressAndNameVO addressAndName(MZRegisterInfoVO bag);
	
	List<RegistedAddressAndNameVO> addressesAndNames();
	
}