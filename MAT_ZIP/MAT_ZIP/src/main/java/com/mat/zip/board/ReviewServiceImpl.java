package com.mat.zip.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mat.zip.registerAndSearch.model.MZRegisterInfoVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDao;
	
	
	
	@Override
	public int insertReview(ReviewVO vo) {
		return reviewDao.insertReview(vo);
	}

	@Override
	public List<MZRegisterReceiptDTO> getReceiptWithRestaurant(String user_id) {
	    return reviewDao.getReceiptWithRestaurant(user_id);
	}

	@Override
	public ReviewVO oneReviewId(int review_id) {
		return reviewDao.oneReviewId(review_id);
	}

	@Override
	public int delete(int review_id) {
		return reviewDao.delete(review_id);
	}

	@Override
	public int update(ReviewVO vo) {
		return reviewDao.update(vo);
	}

	@Override
	public void incrementReviewViewCount(int review_id) {
		reviewDao.incrementReviewViewCount(review_id);
	}

	@Override
	public List<ReviewVO> allReview() {
		return reviewDao.allReview();
	}
	
	
}
