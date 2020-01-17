package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.TheaterVO;

public interface TheaterDAO {

	public void insertTh(TheaterVO th);
	public void updateRowCol(TheaterVO th);
	public void updateTh(TheaterVO th);
	public void deleteTh(int thNo);
	
	public TheaterVO selectTh(int thNo);
	public TheaterVO getRowAndCol(int thNo);
	
	public List<TheaterVO> selectList();
	
	public int isThRsved(int thNo);
	
}//TheaterDAO
