package com.mat.zip.mzMember.model;

import java.util.List;

import com.mat.zip.board.ReviewVO;

public interface MzMemberDAO {
	void signUp(MzMemberDTO dto) throws Exception;

	int memberLogin(MzMemberDTO vo) throws Exception;

	MzMemberDTO getMemberInfo(String id) throws Exception;
	
	void deleteAccount(MzMemberDTO dto) throws Exception;
	
	void changePw(MzMemberDTO dto) throws Exception;
	
	List<ReviewVO> userReview(String userId) throws Exception;
}
