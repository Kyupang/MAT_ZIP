package com.mat.zip.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDAO reviewDAO;
	
//	@Inject
//	public ReviewServiceImpl(ReviewDAO reviewDAO) {
//		this.reviewDAO = reviewDAO;
//	}
	
	
	@Override
	public void create(ReviewVO reviewVO) {
		reviewDAO.create(reviewVO);
		
	}

	@Override
	public ReviewVO oneReviewId(int review_id) {
		return reviewDAO.oneReviewId(review_id);
	}

	@Override
	public void update(ReviewVO reviewVO) {
		reviewDAO.update(reviewVO);
	}

	@Override
	public void delete(int review_id) {
		reviewDAO.delete(review_id);
	}

	@Override
	public List<ReviewVO> allReview() {
		return reviewDAO.allReview();
	}

}
