package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.TheaterVO;

public interface TheaterDAO {

	public void insertTh(TheaterVO th);
	
	public List<TheaterVO> selectList();
	
}//TheaterDAO
