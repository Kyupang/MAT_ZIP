package com.mat.zip.mzMember.model;

public interface MzMemberDAO {
	void signUp(MzMemberDTO dto) throws Exception;

	int memberLogin(MzMemberDTO vo) throws Exception;

	MzMemberDTO getMemberInfo(MzMemberDTO vo) throws Exception;
}
