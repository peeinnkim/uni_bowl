package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.MemberVO;
import com.peeinn.domain.paging.CodeStateCriteria;

public interface MemberService {
	
	public void regist(MemberVO mem);
	public void modify(MemberVO mem);
	public void modifyPw(MemberVO mem);
	public void secession(int mNo);
	
	public List<MemberVO> list();
	public List<MemberVO> searchList(CodeStateCriteria cri);
	
	public MemberVO search(int mNo);
	public MemberVO searchById(String mId);
	public MemberVO searchByMail(String mMail);

	public int totalCnt();
	public int totalCntByCode(CodeStateCriteria cri);
	
	
	/* ------------ [NON-MEMBER] ------------ */
	
	
}//MemberService
