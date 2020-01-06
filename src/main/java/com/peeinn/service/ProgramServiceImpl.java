package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peeinn.domain.ProgramVO;
import com.peeinn.persistence.ProgramDAO;

@Service
public class ProgramServiceImpl implements ProgramService {
	
	@Autowired
	private ProgramDAO dao;

	@Override
	public List<ProgramVO> list() {
		return dao.selectProgramList();
	}

	@Override
	public int totalCnt() {
		return dao.getTotalPgCnt();
	}

	@Override
	@Transactional
	public void regist(ProgramVO pg) {
		dao.insertPg(pg);
	}

	@Override
	public ProgramVO search(int pgNo) {
		return dao.selectPg(pgNo);
	}

	@Override
	public void modify(ProgramVO pg) {
		dao.updatePg(pg);
	}

	@Override
	public void remove(int pgNo) {
		dao.deletePg(pgNo);
	}

}
