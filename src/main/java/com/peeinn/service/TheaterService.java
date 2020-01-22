package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.TheaterVO;

public interface TheaterService {
	
	public void regist(TheaterVO th);
	public void modifyRowAndCol(TheaterVO th);
	public void modify(TheaterVO th);
	public void remove(int thNo);
	
	public TheaterVO search(int thNo);
	public TheaterVO getRowAndCol(int thNo);

	public List<TheaterVO> list();
	
	public int hasRsvedSt(int thNo);
	
}//TheaterService
