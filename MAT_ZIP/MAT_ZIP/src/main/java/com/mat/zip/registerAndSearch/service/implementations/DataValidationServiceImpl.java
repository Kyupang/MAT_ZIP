package com.mat.zip.registerAndSearch.service.implementations;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mat.zip.registerAndSearch.dao.MZRegisterInfoDAO;
import com.mat.zip.registerAndSearch.dao.RestaurantDAO;
import com.mat.zip.registerAndSearch.model.MZRegisterInfoVO;
import com.mat.zip.registerAndSearch.model.RegistedAddressAndNameVO;
import com.mat.zip.registerAndSearch.service.DataValidationService;

@Service
public class DataValidationServiceImpl implements DataValidationService {
	@Autowired
	MZRegisterInfoDAO mzRegisterInfoDAO;
	
	@Autowired
	RestaurantDAO restaurantDAO;
	
	@Override
	public RegistedAddressAndNameVO validateExtractedData(List<String> extractedData) {
		//return 값은 가게 지번 주소와 가게이름인데
		//모든 로직에서 처리된 결과에 따라 
		//가게 지번주소는 알파벳이 될 수 있고 
		//알파벳은 각각의 처리 결과를 보여준다. 
		RegistedAddressAndNameVO result = new RegistedAddressAndNameVO(); 
		
		
		
		//OCR에서 나온 결과값 1,2,3,4,5를 처리.
		//주소 1,2  결제일시 3,4  전화번호 5
		
		// String userId = session.getAttribute('id') 라고 하고
		String userId = "admin";
		String storeAddress = "";
		if(extractedData.get(0).length() <= extractedData.get(1).length() ) {
			storeAddress = extractedData.get(1);
		}else {
			storeAddress = extractedData.get(0);
		}
		String buyTime = extractedData.get(2) +" "+ extractedData.get(3);
		String storePhoneNumber = extractedData.get(4);
		
		//DB에 저장을 하기위한 VO 전처리 후 로직시작 
		MZRegisterInfoVO vo = new MZRegisterInfoVO();
		vo.setUserId(userId);
		vo.setStoreAddress(storeAddress);
		vo.setStorePhoneNumber(storePhoneNumber);
		vo.setBuyTime(buyTime);
		
		// 이 값들을 동시에 가진 DB row가 있는지 없는지를 판단하므로 
		// 첫 등록인지 두 번째 등록인지 판단.
		
		int countInfoInMZ = mzRegisterInfoDAO.countInfoInMZ(vo);
		//처음 등록했다면 
		if(countInfoInMZ == 0) {
			int countInfoInRestaurant = restaurantDAO.countInfoInRestaurant(vo);
			
			//데이터 셋에 있는 정보라면
			//countRestaurant값이 0보다 클것이다. 
			if(countInfoInRestaurant > 0) {
				//그러면 mzRegister DB에 insert 
				mzRegisterInfoDAO.insert(vo);
				
				result.setLandNumAddress("k");
				return result;
			}else {
				//OCR 기능이 잘 처리되지 않았거나 
				//데이터 셋에 해당 주소, 번호가 없는경우 처리 
				if(vo.getStoreAddress().equals("Can not extract address")) {
					result.setLandNumAddress("c");
					return result;
				}else {
					result.setLandNumAddress("a");
					return result;
				}
			}
		}else {
			//두 번 이상 등록이라면 
			//해당 결과물로 등록한 DB값이 있는 것 
			//추출된 시간과 DB에 있는 시간을 비교 후 동일한 시간이 있으면 X
			//동일한 시간이 없다면 insert 후 주소 리턴 
			Boolean isSameTime = true;
			List<MZRegisterInfoVO> inDBResult = mzRegisterInfoDAO.IdInfoList(userId);
			for(MZRegisterInfoVO inDBResultVO : inDBResult) {
				if(!inDBResultVO.getBuyTime().equals(vo.getBuyTime())){
					isSameTime = false;
				}else {
					isSameTime = true;
					result.setLandNumAddress("b");
					return result;
				}
			}
			mzRegisterInfoDAO.insert(vo);
			result = restaurantDAO.addressAndName(vo);
			return result;
		}
		
	}
	
}
