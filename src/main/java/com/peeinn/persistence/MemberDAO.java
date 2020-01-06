package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.MemberVO;
import com.peeinn.domain.NonMemberVO;

public interface MemberDAO {

	public void insertMem(MemberVO mem);
	public void updateMem(MemberVO mem);
	public void secessMem(int mNo);
	
	public List<MemberVO> selectMemList();
	public MemberVO selectMem(int mNo);
	public MemberVO selectMemById(String mId);

	public int getTotalMemCnt();
	
	
	/* ------------ [NON-MEMBER] ------------ */
	
	public void insertNonMem(NonMemberVO nMem);
	public List<NonMemberVO> selectNonMemList();
	public NonMemberVO selectNonMem(int nmNo);
	
	public int getTotalNonMemCnt();
	
}//MemberDAO
