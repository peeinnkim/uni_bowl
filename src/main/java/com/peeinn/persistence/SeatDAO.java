package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.SeatVO;

public interface SeatDAO {

	public void insertSt(SeatVO st);
	public void updateSt(SeatVO st);
	
	public List<SeatVO> selectStList();
	
}//SeatDAO
