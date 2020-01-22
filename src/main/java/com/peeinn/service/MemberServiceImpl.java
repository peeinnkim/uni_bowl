package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peeinn.domain.MemberVO;
import com.peeinn.domain.paging.CodeStateCriteria;
import com.peeinn.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO dao;

	@Override
	public void regist(MemberVO mem) {
		dao.insertMem(mem);
	}

	@Override
	public void modify(MemberVO mem) {
		dao.updateMem(mem);
	}

	@Override
	public void secession(int mNo) {
		dao.secessMem(mNo);
	}

	@Override
	public List<MemberVO> list() {
		return dao.selectMemList();
	}

	@Override
	public MemberVO search(int mNo) {
		return dao.selectMem(mNo);
	}

	@Override
	public int totalCnt() {
		return dao.getTotalMemCnt();
	}

	@Override
	public MemberVO searchById(String mId) {
		return dao.selectMemById(mId);
	}

	@Override
	public MemberVO searchByMail(String mMail) {
		return dao.selectMemByMail(mMail);
	}
	@Override
	public List<MemberVO> searchList(CodeStateCriteria cri) {
		System.out.println("SERVICE CRI->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + cri);
		return dao.searchList(cri);
	}

	@Override
	public int totalCntByCode(CodeStateCriteria cri) {
		return dao.getMemCntByCode(cri);
	}

	@Override
	public void modifyPw(MemberVO mem) {
		dao.updatePw(mem);
	}


}//MemberServiceImpl
