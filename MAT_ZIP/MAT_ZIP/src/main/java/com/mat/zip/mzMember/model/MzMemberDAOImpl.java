package com.mat.zip.mzMember.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.mat.zip.board.ReviewVO;

@Component
public class MzMemberDAOImpl implements MzMemberDAO {
	
	@Inject
	SqlSessionTemplate my;
	//namespace 수정 필요
	String namespace = "mz_member.";
	
	@Override
	public void signUp(MzMemberDTO dto) {
		my.insert(namespace + "signUp", dto);
	}
	
	@Override
	public int memberLogin(MzMemberDTO vo) {
		int result = my.selectOne(namespace + "login", vo);
		return result;
	}
	
	@Override
	public MzMemberDTO getMemberInfo(String id) {
		MzMemberDTO dto = my.selectOne(namespace + "getInfo", id);
		return dto;
	}
	
	@Override
	public void deleteAccount(MzMemberDTO dto) throws Exception {
		my.delete(namespace + "deleteAccount", dto);
	}
	
	@Override
	public void changePw(MzMemberDTO dto) throws Exception {
		my.update(namespace + "changePw", dto);
	}
	
	@Override
	public List<ReviewVO> userReview(String userId) throws Exception {
		List<ReviewVO> reviewVO = my.selectList(namespace + "getReview", userId);
		return reviewVO;
	}
	
	@Override
	public int memberCheck(String id) throws Exception {
		int result = my.selectOne(namespace + "memberCheck", id);
		return result;
	}
	
	@Override
	public void updateInfo(MzMemberDTO dto) throws Exception {
		my.update(namespace + "updateInfo", dto);
	}
	
}

