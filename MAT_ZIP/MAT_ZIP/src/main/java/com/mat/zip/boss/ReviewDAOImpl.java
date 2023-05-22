package com.mat.zip.boss;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<String> TotalReview(String storeId) {
        return sqlSession.selectList("TotalReview", storeId);
    }
}

