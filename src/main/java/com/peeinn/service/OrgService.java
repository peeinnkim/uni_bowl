package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.OrgVO;
import com.peeinn.domain.org.OrgResultVO;

public interface OrgService {

	public void regist(OrgVO org);
	public void modify(OrgVO org);
	public void remove(int orgNo);
	
	public List<OrgResultVO> orgResultList();
	public List<OrgResultVO> orgByDateList(String sDate, int orgThNo);
	public List<OrgResultVO> orgDateList(String sDate);
	
	public OrgResultVO search(int orgNo);
	
	public int orgCnt();
	public int isRsved(int orgNo);
	
	public List<Integer> repeatCntByPg(String sDate);
	
}//OrgResultService
