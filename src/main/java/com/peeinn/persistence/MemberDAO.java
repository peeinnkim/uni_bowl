package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.MemberVO;
import com.peeinn.domain.paging.SearchCriteria;

public interface MemberDAO {

	public void insertMem(MemberVO mem);
	public void updateMem(MemberVO mem);
	public void secessMem(int mNo);
	
	public List<MemberVO> selectMemList();
	public List<MemberVO> searchList(SearchCriteria cri, int memCode, int state);

	public MemberVO selectMem(int mNo);
	public MemberVO selectMemById(String mId);

	public int getTotalMemCnt();
	public int getMemCntByCode(SearchCriteria cri, int memCode, int state);
	
	
	/* ------------ [NON-MEMBER] ------------ */
	
}//MemberDAO
