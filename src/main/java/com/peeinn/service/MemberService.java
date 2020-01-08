package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.MemberVO;
import com.peeinn.domain.paging.SearchCriteria;

public interface MemberService {
	
	public void regist(MemberVO mem);
	public void modify(MemberVO mem);
	public void secession(int mNo);
	
	public List<MemberVO> list();
	public List<MemberVO> searchList(SearchCriteria cri, int memCode, int state);
	
	public MemberVO search(int mNo);
	public MemberVO searchById(String mId);

	public int totalCnt();
	public int totalCntByCode(SearchCriteria cri, int memCode, int state);
	
	
	/* ------------ [NON-MEMBER] ------------ */
	
	
}//MemberService
