package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peeinn.domain.SeatVO;
import com.peeinn.persistence.SeatDAO;

@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatDAO dao;
	
	@Override
	public void regist(List<SeatVO> stList) {
		for(SeatVO st : stList) {
			dao.insertSt(st);
		}
	}

	@Override
	public void modify(SeatVO st) {
		dao.updateSt(st);
	}

	@Override
	public List<SeatVO> list() {
		return dao.selectStList();
	}

	@Override
	public List<SeatVO> listByThAndOrg(int thNo, int orgNo) {
		return dao.selectListByThAndOrg(thNo, orgNo);
	}

	@Override
	public List<SeatVO> listByThNo(int thNo) {
		return dao.selectStListByThNo(thNo);
	}

	
}//SeatServiceImpl
