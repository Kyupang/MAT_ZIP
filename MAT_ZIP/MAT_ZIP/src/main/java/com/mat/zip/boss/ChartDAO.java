package com.mat.zip.boss;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAO {

    private static final String namespace = "chartMapper";

    private final SqlSession sqlSession;

    @Autowired
    public ChartDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<ChartVO> DailyTotalAmount(String storeId) {
        return sqlSession.selectList(namespace + ".DailyTotalAmount",storeId);
    }
    public List<ChartVO> XTotalAmount(String storeId) {
    	return sqlSession.selectList(namespace + ".XTotalAmount",storeId);
    }
}
