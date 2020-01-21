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
	@Transactional
	public List<StInfoVO> listByThAndOrg(int thNo, int orgNo) {
		List<StInfoVO> list = dao.selectListByThAndOrg(thNo, orgNo);
		System.out.println("service list ->>>>>>>" + list);
		return list;
	}

	@Override
	public List<SeatVO> listByThNo(int thNo) {
		return dao.selectStListByThNo(thNo);
	}

	
}//SeatServiceImpl
