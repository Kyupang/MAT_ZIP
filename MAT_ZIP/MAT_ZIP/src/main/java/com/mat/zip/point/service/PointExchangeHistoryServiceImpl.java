package com.mat.zip.point.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mat.zip.point.dao.PointExchangeHistoryDAO;
import com.mat.zip.point.model.PointDetailHistoryVO;
import com.mat.zip.point.model.PointExchangeHistoryVO;
import com.mat.zip.point.model.PointSaveHistoryVO;
import com.mat.zip.point.model.ProductPointVO;
import com.mat.zip.point.model.SendSmsVO;

@Service
public class PointExchangeHistoryServiceImpl implements PointExchangeHistoryService {

	@Autowired
	PointExchangeHistoryDAO PointExchangeHistoryDAO;
	@Autowired
	SensAPI sensapi;

	@Override
	@Transactional
	//적립 포인트 상품 교환 비즈니스 로직
	public void exChange(String user_id, int id) {
		
		PointSaveHistoryVO userpoint = PointExchangeHistoryDAO.pointsaveFind(user_id);
		ProductPointVO product = PointExchangeHistoryDAO.productPointFind(id);
		// 보유 포인트 확인 메서드
		checkPoint(userpoint, product);
		// 보유 포인트 확인 후 교환된 포인트 INSERT
		insertUsePoint(userpoint, product);
		// 교환된 기프티콘 이미지 MMS 전송
		sendSms(userpoint, product);

	}

	// 보유 포인트 확인
	private void checkPoint(PointSaveHistoryVO userpoint, ProductPointVO product) {
		if (userpoint.getSumpoint() < product.getPoint()) {
			System.out.println(userpoint.getSumpoint());
			throw new IllegalArgumentException("보유한 포인트가 부족합니다.");
		}
	}

	// 사용 포인트 저장
	private void insertUsePoint(PointSaveHistoryVO userpoint, ProductPointVO product) {
		PointExchangeHistoryVO pointbag = new PointExchangeHistoryVO();
		pointbag.setUser_id(userpoint.getUser_id());
		pointbag.setPoint(product.getPoint());
		PointExchangeHistoryDAO.usepointinsert(pointbag);
	}

	// MMS 전송
	private void sendSms(PointSaveHistoryVO userpoint, ProductPointVO product) {
		SendSmsVO sms = new SendSmsVO();
		sms.setUser_id(userpoint.getUser_id());
		sms.setImg(product.getImg());
		// sms.setTel(tel);
		//sensapi.sendSMS(sms);
	}

	@Override
	//상품 교환 후 상세 이력관리 테이블 저장 로직
	public void useDetailHistory(String user_id, int id) {
		//pointhistory 테이블에 저장된 user_id 데이터 List로 가져오기
		List<PointSaveHistoryVO> savedPointsList = PointExchangeHistoryDAO.pointsaveFindAll(user_id);
		//선택한 제품의 정보 가져오기
		ProductPointVO product = PointExchangeHistoryDAO.productPointFind(id);

		//상세 이력관리 테이블 insert 메서드
		processPoint(savedPointsList, user_id, product);
	}
	
	//Queue 구조를 활용한 상세이력관리 저장 프로세스
	private void processPoint(List<PointSaveHistoryVO> savedPointsList, String user_id, ProductPointVO product) {
		Queue<PointSaveHistoryVO> savedPoints = new LinkedList<>(savedPointsList);
		int productPoint = product.getPoint();
		
		/* 적립된 포인트를 날짜순서로 
		 * 불러온 리스트에 앞부분 데이터를
		 * poll해서 제품의 가격과 비교 후 하나씩 저장하는 알고리즘
		*/
		while (!savedPoints.isEmpty() && productPoint > 0) {
	        PointSaveHistoryVO savedPoint = savedPoints.poll();
	        //포인트 사용 이벤트 메서드 호출(적립된 포인트를 제품 가격에서 순서대로 차감)
	        productPoint = usePointEvent(savedPoint, productPoint, user_id);
		}
		
		//마지막 포인트까지 차감되면 런타임 예외처리 동작 종료 메서드
		validateRemainingPoints(productPoint);
	}

	private int usePointEvent(PointSaveHistoryVO savedPoint, int productPoint, String user_id) {
		int currentPoint = savedPoint.getPoint();

		if (currentPoint <= productPoint) {
			productPoint -= currentPoint;
			savedPoint.setPoint(-currentPoint);
		} else {
			savedPoint.setPoint(-productPoint);
			productPoint = 0;
		}

		insertDetailHistory(user_id, savedPoint);

		return productPoint;
	}
	
	private void insertDetailHistory(String user_id, PointSaveHistoryVO savedPoint) {
		PointDetailHistoryVO detailhistory = new PointDetailHistoryVO();
		detailhistory.setUser_id(user_id);
		detailhistory.setPoint(savedPoint.getPoint());
		PointExchangeHistoryDAO.usedetailpointinsert(detailhistory);
	}
	
	private void validateRemainingPoints(int productPoint) {
		if (productPoint > 0) {
			throw new IllegalArgumentException("Not enough points");
		}
	}
}
