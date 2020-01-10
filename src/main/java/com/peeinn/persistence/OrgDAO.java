package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.OrgVO;
import com.peeinn.domain.org.OrgResultVO;

public interface OrgDAO {

	public void insertOrg(OrgVO org);
	public void updateOrg(OrgVO org);
	public void deleteOrg(int orgNo);
	
	public List<OrgResultVO> selectOrgList();
	public List<OrgResultVO> selectOrgListByDate(String sDate);
	
	public OrgResultVO selectOrg(int orgNo);
	
	public int getTotalOrgCnt();
	
}//OrgDAO
