package com.mat.zip.board;

import java.util.List;

public interface ReviewDAO {
	
	public void create(ReviewVO reviewVO); // 리뷰글쓰기
	
	public ReviewVO oneReviewId(int review_id); // 리뷰게시글 상세조회 
	
	public void update(ReviewVO reviewVO); // 리뷰게시글 수정 
	
	public void delete(int review_id); // 리뷰게시글 삭제
	
	public List<ReviewVO> allReview(); // 리뷰게시글 전체 list 조회 

}
