package com.peeinn.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.OrgVO;
import com.peeinn.domain.org.OrgResultVO;

@Repository
public class OrgDAOImpl implements OrgDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.OrgMapper";
	
	@Override
	public void insertOrg(OrgVO org) {
		sqlSession.insert(namespace + ".insertOrg", org);
	}

	@Override
	public void updateOrg(OrgVO org) {
		sqlSession.update(namespace + ".updateOrg", org);
	}

	@Override
	public void deleteOrg(int orgNo) {
		sqlSession.delete(namespace + ".deleteOrg", orgNo);
	}

	@Override
	public List<OrgResultVO> selectOrgList() {
		return sqlSession.selectList(namespace + ".selectOrgList");
	}

	@Override
	public OrgResultVO selectOrg(int orgNo) {
		return sqlSession.selectOne(namespace + ".selectOrg", orgNo);
	}

	@Override
	public int getTotalOrgCnt() {
		return sqlSession.selectOne(namespace + ".getTotalOrgCnt");
	}

	@Override
	public List<OrgResultVO> selectOrgListByDate(String sDate, int orgThNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sDate", sDate);
		map.put("orgThNo", orgThNo);
		
		return sqlSession.selectList(namespace + ".selectOrgListByDate", map);
	}

	@Override
	public List<OrgResultVO> selectOrgDateList(String sDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sDate", sDate);
		
		return sqlSession.selectList(namespace + ".selectOrgDateList", map);
	}

	@Override
	public List<Integer> getRepeatCntByProgram(String sDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sDate", sDate);
		
		return sqlSession.selectList(namespace + ".getRepeatCntByProgram", map);
	}

	@Override
	public int isRsved(int orgNo) {
		return sqlSession.selectOne(namespace + ".isRsved", orgNo);
	}


}//OrgDAOImpl
