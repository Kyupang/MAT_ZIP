package com.mat.zip.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	private static final String NAMESPACE = "com.mat.zip.mapper.ReviewMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public ReviewDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	@Override
	public void create(ReviewVO reviewVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", reviewVO); 
	}

	@Override
	public ReviewVO oneReviewId(int review_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".oneReviewId", review_id);
	}

	@Override
	public void update(ReviewVO reviewVO) throws Exception {
		sqlSession.update(NAMESPACE + ".update", reviewVO);
	}

	@Override
	public void delete(int review_id) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", review_id);
	}

	@Override
	public List<ReviewVO> allReview() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".allReview");
	}

}
