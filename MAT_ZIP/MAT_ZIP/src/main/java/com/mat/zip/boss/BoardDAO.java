package com.mat.zip.boss;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.ibatis.javassist.runtime.Desc;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//테이블 하나당 DAO 하나 ! -->CUD를 완성 !! 
@Component
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate my;
	

	public int insert(BoardVO bag) {
		int result = my.insert("board.create", bag);
		return result;
	}
	public int update(BoardVO bag) {
		int result = my.update("board.up", bag);
		return result;
	}
	
	public int delete(int board_id) {
		int result = my.update("board.del", board_id);
		return result;
		
	}
	
	public BoardVO one(int board_id) {
		BoardVO bag = my.selectOne("board.one", board_id);
		return bag;
	}// one
	public BoardVO detail(int board_id) {
		BoardVO bag = my.selectOne("board.detail", board_id);
		return bag;
	}// one

	public List<BoardVO> list(int limit) {
		return my.selectList("board.list",limit);

	} //list
	public int view(int board_id) {
		int result = my.update("board.view",board_id);
		return result;
	}
	public void increaseLikeCount(int board_id) {
	    my.update("board.increaseLikeCount", board_id);
	}
	public void decreaseLikeCount(int board_id) {
        my.update("board.decreaseLikeCount", board_id);
    }

    public void addLike(String user_id, int board_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", user_id);
        params.put("board_id", board_id);
        my.insert("board.addLike", params);
    }

    public void removeLike(String user_id, int board_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", user_id);
        params.put("board_id", board_id);
        my.delete("board.removeLike", params);
    }

    public boolean isLikedByUser(String user_id, int board_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", user_id);
        params.put("board_id", board_id);
        return my.selectOne("board.isLikedByUser", params);
    }
    
    public int getLikeCount(int board_id) {
        return my.selectOne("board.getLikeCount", board_id);
    }
}

	
	

