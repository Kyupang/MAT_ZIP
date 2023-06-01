package com.mat.zip.mzMember.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mat.zip.board.ReviewVO;
import com.mat.zip.mzMember.model.MzMemberDTO;

public interface MzMemberService {
	
	int memberLogin(MzMemberDTO dto) throws Exception;
	
	void signUp(MzMemberDTO dto) throws Exception; 
	
	String authEmail(String email) throws Exception;
	
	MzMemberDTO getMemberInfo(String id) throws Exception;
	
	void mailSend(String setFrom, String toMail, String title, String content) throws Exception;
	
	void deleteAccount(MzMemberDTO dto) throws Exception; 
	
	void changePw(MzMemberDTO dto, HttpSession session) throws Exception;
	
	List<ReviewVO> getReview(String userId) throws Exception;
	
	int memberCheck(String id) throws Exception;
	
	void updateInfo(MzMemberDTO dto, HttpSession session) throws Exception;
	
	String temPwEmail(String email) throws Exception;
	
	void changeTemPw(String email, MzMemberDTO dto) throws Exception;
}
