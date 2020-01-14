package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.SeatVO;

public interface SeatDAO {

	public void insertSt(SeatVO st);
	public void updateSt(SeatVO st);
	public void deleteSt(int thNo);
	
	public List<SeatVO> selectStList();
	public List<SeatVO> selectStListByThNo(int thNo);
	
}//SeatDAO
