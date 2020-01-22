package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peeinn.domain.TheaterVO;
import com.peeinn.persistence.SeatDAO;
import com.peeinn.persistence.TheaterDAO;

@Service
public class TheaterServiceImpl implements TheaterService {

	@Autowired
	private TheaterDAO dao;
	@Autowired
	private SeatDAO sDao;
	
	@Override
	public void regist(TheaterVO th) {
		dao.insertTh(th);
	}

	@Override
	public List<TheaterVO> list() {
		return dao.selectList();
	}

	@Override
	public TheaterVO search(int thNo) {
		return dao.selectTh(thNo);
	}

	@Override
	public void modifyRowAndCol(TheaterVO th) {
		dao.updateRowCol(th);
	}

	@Override
	public void remove(int thNo) {
		sDao.deleteSt(thNo);
		dao.deleteTh(thNo);
	}

	@Override
	public TheaterVO getRowAndCol(int thNo) {
		return dao.getRowAndCol(thNo);
	}

	@Override
	public int hasRsvedSt(int thNo) {
		return dao.hasRsvedSt(thNo);
	}

	@Override
	public void modify(TheaterVO th) {
		dao.updateTh(th);
	}

}//TheaterServiceImpl
