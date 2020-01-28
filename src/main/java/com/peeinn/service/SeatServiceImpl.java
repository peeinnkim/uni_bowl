package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peeinn.domain.SeatVO;
import com.peeinn.domain.org.StInfoVO;
import com.peeinn.persistence.SeatDAO;

@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatDAO dao;
	
	@Override
	@Transactional
	public void regist(List<SeatVO> stList) {
		for(SeatVO st : stList) {
			dao.insertSt(st);
		}
	}

	@Override
	@Transactional
	public void modify(List<SeatVO> stList) {
		for(SeatVO st : stList) {
			dao.updateSt(st);
		}
	}

	@Override
	@Transactional
	public void modifyAll(int thNo, List<SeatVO> stList) {
		dao.deleteSt(thNo);
		
		for(SeatVO st : stList) {
			dao.insertSt(st);
		}
	}

	@Override
	public List<SeatVO> list() {
		return dao.selectStList();
	}

	@Override
	public List<StInfoVO> listByThAndOrg(int thNo, int orgNo) {
		return dao.selectListByThAndOrg(thNo, orgNo);
	}

	@Override
	public List<SeatVO> listByThNo(int thNo) {
		return dao.selectStListByThNo(thNo);
	}

	
}//SeatServiceImpl
