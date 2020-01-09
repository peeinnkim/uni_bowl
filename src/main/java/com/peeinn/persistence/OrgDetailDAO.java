package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.OrgDetailVO;

public interface OrgDetailDAO {

	public void insertOd(OrgDetailVO od);
	public void updateOd(OrgDetailVO od);
	public void deleteOd(int odNo);
	
	public List<OrgDetailVO> selectOdList();
	
	public OrgDetailVO selectOd();
	
	public int getTotalOdCnt();
	
}//OrgDAO
