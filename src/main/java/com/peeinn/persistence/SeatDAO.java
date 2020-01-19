package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.SeatVO;

public interface SeatDAO {

	public void insertSt(SeatVO st);
	public void updateSt(SeatVO st);
	public void deleteSt(int thNo);
	public void changeStState(SeatVO st);
	
	public List<SeatVO> selectStList();
	public List<SeatVO> selectStListByThNo(int thNo);
	public List<SeatVO> selectListByThAndOrg(int thNo, int orgNo);
	
}//SeatDAO
