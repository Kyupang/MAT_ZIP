package com.mat.zip.board;

import java.util.List;

public interface ReviewService {
	
	public void create(ReviewVO reviewVO);
	
	public ReviewVO oneReviewId(int review_id);
	
	public void update(ReviewVO reviewVO);
	
	public void delete(int review_id);
	
	public List<ReviewVO> allReview();
	
}
