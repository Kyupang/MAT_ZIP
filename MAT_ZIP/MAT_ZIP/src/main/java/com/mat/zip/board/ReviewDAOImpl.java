package com.mat.zip.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	private static String NAMESPACE = "com.mat.zip.mapper.ReviewMapper";
	
	@Inject
	SqlSession sqlSession;
	
//	@Inject
//	public ReviewDAOImpl(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}
	
	
	// 리뷰 게시글 작성
	@Override
	public void create(ReviewVO reviewVO) {
		sqlSession.insert(NAMESPACE + ".create", reviewVO); 
	}

	
	// 리뷰게시글 상세조회
	@Override
	public ReviewVO oneReviewId(int review_id) {
		return sqlSession.selectOne(NAMESPACE + ".oneReviewId", review_id);
	}
	
	
	// 리뷰게시글 수정 
	@Override
	public void update(ReviewVO reviewVO) {
		sqlSession.update(NAMESPACE + ".update", reviewVO);
	}
	
	
	// 리뷰게시글 삭제
	@Override
	public void delete(int review_id) {
		sqlSession.delete(NAMESPACE + ".delete", review_id);
	}
	
	
	// 리뷰게시글 전체 list 조회 
	@Override
	public List<ReviewVO> allReview() {
		return sqlSession.selectList(NAMESPACE + ".allReview");
	}

}
