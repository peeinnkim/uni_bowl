package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.ProgramVO;

public interface ProgramDAO {

	public void insertPg(ProgramVO pg);
	public void updatePg(ProgramVO pg);
	public void deletePg(int pgNo);
	
	public List<ProgramVO> selectProgramList();
	
	public ProgramVO selectPg(int pgNo);

	public int getTotalPgCnt();
	
	
}//ProgramDAO
