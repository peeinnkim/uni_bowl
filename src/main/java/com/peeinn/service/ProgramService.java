package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.ProgramVO;

public interface ProgramService {
	
	public void regist(ProgramVO pg);
	public void modify(ProgramVO pg);
	public void remove(int pgNo);
	
	public List<ProgramVO> list();

	public ProgramVO search(int pgNo);
	
	public int totalCnt();

}//ProgramService
