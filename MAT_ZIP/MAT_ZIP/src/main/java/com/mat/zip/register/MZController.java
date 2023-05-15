package com.mat.zip.register;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mat.zip.point.PointSaveHistoryService;
import com.mat.zip.point.PointSaveHistoryVO;


@Controller
public class MZController {
	@Autowired
	MZInfoDAO mzInfodao;
	@Autowired
	RestaurantDAO restaurantdao;
	@Autowired
	PointSaveHistoryService PointSaveHistoryService;
	

	//검색 기능 자동완성 데이터 가져오기 and 검색 키워드 마커찍어주기 컨트롤러 기능 
	//지도 업데이트 버튼 관련 함수 
	@RequestMapping(value = {"/register/Remap.mz", "/register/autoComplete.mz" , "register/searchResultMarker.mz"})
	@ResponseBody // 요청을 받으면 return되는 데이터를 json으로 만들어서 요청하는 곳으로 다시 보냄,
	public List<MixedWithTwoDBVO> getAddressAndName() {
		//일단 mz에 있는 주소 다 데려와. 
		//DB에 일치하는 주소와 name을 가져와서 RestaurantVO에 집어넣고 넘겨.
		List<MixedWithTwoDBVO> resultList = restaurantdao.addressAndName();
		
		return resultList ;
	}


	//등록 이미지 저장 코드 
	@Autowired
	OCRGeneralAPI ocrService;

	//postmapping 으로 파일 저장!!! 
	//저장한 파일로 API 호출해 
	@PostMapping("/register/uploadFormAction")
	@ResponseBody 
	public MZInfoVO start(MultipartFile[] uploadFile) throws FileNotFoundException {
		String uploadFolder = "D:\\upload\\"; // 저장할 폴더 경로
		String savedFilePath = null;
		for (MultipartFile multipartFile : uploadFile) {
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			savedFilePath = saveFile.getAbsolutePath();
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("savedFilePath : " + savedFilePath);
		
		List<String> list = clovaOCR(savedFilePath);
		
		//String에 주소 저장.
		String storeAddress = "";
		if(list.get(0).length() <= list.get(1).length() ) {
			storeAddress = list.get(1);
		}else {
			storeAddress = list.get(0);
		}
		System.out.println(storeAddress);
		
		///////////////////////////////////////////////////////////////////
		// String userId = session.getAttribute('id') 라고 하고
		String userId = "admin";
		// storeAddress 스트링을 OCR을 통해 가져왔다. 
		// 현재 주어진 값들을 가지고 
		//
		// 이 값들을 동시에 가진 DB row가 있는지? 
		// mapper.xml:select count(*) from mzinfo where id = #{sessionId} and storeAdress = #{storeAddress}
		// dao : return count
		String buyTime = list.get(2) +" "+ list.get(3);
		System.out.println(buyTime);
		
		//2.
		MZInfoVO bag = new MZInfoVO();
		
		// 포인트 적립 기능
		PointSaveHistoryVO bag2 = new PointSaveHistoryVO();
		bag2.setUser_id("home");
		
		bag.setUserId(userId); //-
		bag.setStoreAddress(storeAddress); //-
		bag.setBuyTime(buyTime); //-
		int searchResultCountByMZInfo = mzInfodao.countByIdAndAddress(bag);
		// controller : if (count> 0){}
		//					else{}
		if(searchResultCountByMZInfo == 0) {
			///////////////////////////////////////////////////////////////////
			// 해당 결과물에 대한 mzinfo db값이 없다면 즉 count가 0이라면 
			// 식당mapper 파일에서 select count(*) from restaurant where address = address가 1이라면.
			// dao에서 return count!!!
			// controller에서 return값을 count에 저장한 후  if (count> 0)
			int searchResultCountByRestaurant = restaurantdao.countByAddressInRestaurant(bag);
			
			if(searchResultCountByRestaurant > 0) {
				// dao.insert (아이디,시간,주소,카운트(1))을 등록 해야하고 
				// 만약 그런 column이 없다면 불가 메시지를 보내야함. 
				///////////////////////////////////////////////////////////////////			
				bag.setResiCount(1);
				mzInfodao.insert(bag);	
				
				//첫번째 등록
				// 등록이 완료되었습니다.  
				bag.setStoreAddress("k");
				
				//포인트 적립 서비스 호출(영휘)
				PointSaveHistoryService.addPoint(bag2);
				
				return bag;
			}else {
				//a= "찍어주신 주소와 일치하는 가게가 없습니다. "
				if(bag.getStoreAddress().equals("no")) {
					//c=주소 추출불가. no뜸 주소를 제대로 찍거나 개발자에게 문의 주십시오
					bag.setStoreAddress("c");
					return bag;
				}else {
					bag.setStoreAddress("a");
					return bag;
				}
				
			}

		} else {
			///////////////////////////////////////////////////////////////////
			// 해당 결과물에 대한 db값이 있다면 즉 count가 1이라면 			
			// 추출된 시간과 bag에 있는 시간 값을 비교해서 다르다면 
			
			//이거 toDo list : 지금 원래 백에 들어가있는 데이터 주소로 검색해서 가져와서 그 시간값하고 비교해 그리고는 
			// 카운트1 증가시키는거다. 
			MZInfoVO inDBResult = mzInfodao.select_one(storeAddress);
			if(!inDBResult.getBuyTime().equals(bag.getBuyTime())) {
				//dao.update 기존 카운트에 카운트를 1추가해서 저장~ 
				bag.setResiCount(inDBResult.getResiCount()+1);
				mzInfodao.update(bag);
				
				//영휘님 
				
				return bag;
			}else {
				// 같다면 불가메시지를 보내야함.
				//b="영수증에 나와있는 결제일자 시간이 같습니다."
				bag.setStoreAddress("b");
				return bag;
			}
					
			
			// return 주소를 하면 지도를 그려주겠지. 마커를 찍어준다. 
		}

	}
	//OCR 호출
	public List<String> clovaOCR(String savedFilePath) {
		List<String> results = null;
		try {
			results = ocrService.OCRAPI(savedFilePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return results;
	}

	
	
	

	
	
}
