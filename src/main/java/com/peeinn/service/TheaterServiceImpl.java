package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peeinn.domain.TheaterVO;
import com.peeinn.persistence.TheaterDAO;

@Service
public class TheaterServiceImpl implements TheaterService {

	@Autowired
	private TheaterDAO dao;
	
	@Override
	public void regist(TheaterVO th) {
		dao.insertTh(th);
	}

	@Override
	public List<TheaterVO> list() {
		return dao.selectList();
	}
	
	
	
}//TheaterServiceImpl
