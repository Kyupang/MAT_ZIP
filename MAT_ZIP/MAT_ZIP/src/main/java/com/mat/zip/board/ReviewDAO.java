package com.mat.zip.board;

import java.util.List;

import com.mat.zip.registerAndSearch.model.MZRegisterInfoVO;

public interface ReviewDAO {

	public int insertReview(ReviewVO vo);

	List<MZRegisterReceiptDTO> getReceiptWithRestaurant(String user_id);

	public ReviewVO oneReviewId(int review_id);

	public int delete(int review_id);

	public int update(ReviewVO vo);

	public void incrementReviewViewCount(int review_id);

	public List<ReviewVO> allReview();
	
	public List<EmojiMapVO> findAllEmojis();
	
	public List<ReviewVO> searchReview(String searchTerm);

}
