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
	public List<OrgResultVO> selectOrgListByDate(String sDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sDate", sDate);
		
		return sqlSession.selectList(namespace + ".selectOrgListByDate", map);
	}


}//OrgDAOImpl
