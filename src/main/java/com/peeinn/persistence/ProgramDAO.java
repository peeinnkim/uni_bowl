package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.ProgramVO;

public interface ProgramDAO {

	public void insertPg(ProgramVO pg);
	public void updatePg(ProgramVO pg);
	public void deletePg(int pgNo);
	
	public List<ProgramVO> selectProgramList();
	public List<ProgramVO> selectNew3List();
	public List<ProgramVO> selectBest3List();
	
	public ProgramVO selectPg(int pgNo);

	public int getTotalPgCnt();
	public int isPgRsved(int pgNo);
	
	
}//ProgramDAO
