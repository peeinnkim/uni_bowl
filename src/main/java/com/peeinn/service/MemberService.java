package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.MemberVO;

public interface MemberService {
	
	public void regist(MemberVO mem);
	public void modify(MemberVO mem);
	public void secession(int mNo);
	
	public List<MemberVO> list();
	public MemberVO search(int mNo);
	public MemberVO searchById(String mId);

	public int totalCnt();
	
	
	/* ------------ [NON-MEMBER] ------------ */
	
	
}//MemberService
