package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peeinn.domain.OrgVO;
import com.peeinn.domain.org.OrgResultVO;
import com.peeinn.persistence.OrgDAO;

@Service
public class OrgServiceImpl implements OrgService {

	@Autowired
	private OrgDAO dao;
	
	@Override
	public void regist(OrgVO org) {
		dao.insertOrg(org);
	}

	@Override
	public void modify(OrgVO org) {
		dao.updateOrg(org);
	}

	@Override
	public void remove(int orgNo) {
		dao.deleteOrg(orgNo);
	}

	@Override
	public List<OrgResultVO> orgResultList() {
		return dao.selectOrgList();
	}

	@Override
	public OrgResultVO search(int orgNo) {
		return dao.selectOrg(orgNo);
	}

	@Override
	public int orgCnt() {
		return dao.getTotalOrgCnt();
	}

	@Override
	public List<OrgResultVO> orgByDateList(String sDate, int orgThNo) {
		return dao.selectOrgListByDate(sDate, orgThNo);
	}

	@Override
	public List<OrgResultVO> orgDateList(String sDate) {
		return dao.selectOrgDateList(sDate);
	}

	@Override
	public List<Integer> repeatCntByPg() {
		return dao.getRepeatCntByProgram();
	}

}//OrgServiceImpl
