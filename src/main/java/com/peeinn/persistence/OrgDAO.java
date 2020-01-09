package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.OrgVO;

public interface OrgDAO {

	public void insertOrg(OrgVO od);
	public void updateOrg(OrgVO od);
	public void deleteOrg(int odNo);
	
	public List<OrgVO> selectOrgList();
	
	public OrgVO selectOrg();
	
	public int getTotalOrgCnt();
	
}//OrgDAO
