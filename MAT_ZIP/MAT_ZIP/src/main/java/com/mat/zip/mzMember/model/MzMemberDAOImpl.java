package com.mat.zip.mzMember.model;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

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
}

