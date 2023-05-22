package com.mat.zip.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mat.zip.board.PostVO;

@Component
public class PostDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	// 자유게시판 게시물 등록 insert
	public int insert(PostVO vo) {
	int result = my.insert("postVO.createPost", vo);
	return result;
	}
	
	// 자유게시판 게시물 수정 update 
	public int update(PostVO vo) {
		int result = my.update("postVO.updatePost", vo);
		return result;
	}
	
	// 자유게시판 게시물 삭제 delete
	public int delete(PostVO vo) {
		int result = my.delete("postVO.deletePost", vo);
		return result;
	}	
	
	// 게시글 조회수 증가
    public void incrementPostViewCount(int post_id) {
        my.update("postVO.incrementPostViewCount", post_id);
    }
	
	// 조건별 검색 : post_id로 검색하기
	public PostVO onePostId(int post_id) {
		PostVO vo = my.selectOne("postVO.onePostId", post_id);
		System.out.println(vo);
		return vo;
	}
	
	// 조건별 검색 : user_id로 검색하기
	public PostVO onePostUserid(String user_id) {
		PostVO vo = my.selectOne("postVO.onePostUserid", user_id);
		System.out.println(vo);
		return vo;
	}
	
	// 조건별 검색 : food_cg로 검색하기
	public PostVO onePostFoodcg(String food_id) {
		PostVO vo = my.selectOne("postVO.onePostFoodcg", food_id);
		System.out.println(vo);
		return vo;
	}
	
	// 자유게시판 전체 게시글 검색 
	public List<PostVO> allPost() {
		List<PostVO> list = my.selectList("postVO.allPost");
		System.out.println(list.size());
		return list;
	}
}
