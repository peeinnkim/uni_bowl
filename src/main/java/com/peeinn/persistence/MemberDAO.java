package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.MemberVO;

public interface MemberDAO {

	public void insertMem(MemberVO mem);
	public void updateMem(MemberVO mem);
	public void secessMem(int mNo);
	
	public List<MemberVO> selectMemList();
	public MemberVO selectMem(int mNo);
	public MemberVO selectMemById(String mId);

	public int getTotalMemCnt();
	
	
	/* ------------ [NON-MEMBER] ------------ */
	
}//MemberDAO
