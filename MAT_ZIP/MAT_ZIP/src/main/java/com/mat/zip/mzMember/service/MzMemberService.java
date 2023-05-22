package com.mat.zip.mzMember.service;

import com.mat.zip.mzMember.model.MzMemberDTO;

public interface MzMemberService {
	
	public int memberLogin(MzMemberDTO dto) throws Exception;
	
	public void signUp(MzMemberDTO dto) throws Exception; 
	
	public String authEmail(String email) throws Exception;
	
	public MzMemberDTO getMemberInfo(MzMemberDTO dto) throws Exception;
	
	public void mailSend(String setFrom, String toMail, String title, String content) throws Exception;
	
}
