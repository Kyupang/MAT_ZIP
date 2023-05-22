package com.mat.zip.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private final ReviewDAO reviewDAO;
	
	@Inject
	public ReviewServiceImpl(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}
	
	
	@Override
	public void create(ReviewVO reviewVO) throws Exception {
		reviewDAO.create(reviewVO);
		
	}

	@Override
	public ReviewVO oneReviewId(int review_id) throws Exception {
		return reviewDAO.oneReviewId(review_id);
	}

	@Override
	public void update(ReviewVO reviewVO) throws Exception {
		reviewDAO.update(reviewVO);
	}

	@Override
	public void delete(int review_id) throws Exception {
		reviewDAO.delete(review_id);
	}

	@Override
	public List<ReviewVO> allReview() throws Exception {
		return reviewDAO.allReview();
	}

}
