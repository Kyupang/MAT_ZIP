package com.mat.zip.board;

import java.util.List;

public interface ReviewService {
	
	void create(ReviewVO reviewVO) throws Exception;
	
	ReviewVO oneReviewId(int review_id) throws Exception;
	
	void update(ReviewVO reviewVO) throws Exception;
	
	void delete(int review_id) throws Exception;
	
	List<ReviewVO> allReview() throws Exception;
	
}
