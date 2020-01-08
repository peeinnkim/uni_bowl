package com.peeinn.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.MemberVO;
import com.peeinn.domain.paging.SearchCriteria;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.MemberMapper";

	@Override
	public void insertMem(MemberVO mem) {
		sqlSession.insert(namespace + ".insertMem", mem);
	}

	@Override
	public void updateMem(MemberVO mem) {
		sqlSession.update(namespace + ".updateMem", mem);
	}

	@Override
	public void secessMem(int mNo) {
		sqlSession.update(namespace + ".secessMem", mNo);
	}

	@Override
	public List<MemberVO> selectMemList() {
		return sqlSession.selectList(namespace + ".selectMemList");
	}

	@Override
	public MemberVO selectMem(int mNo) {
		return sqlSession.selectOne(namespace + ".selectMem", mNo);
	}

	@Override
	public int getTotalMemCnt() {
		return sqlSession.insert(namespace + ".getTotalMemCnt");
	}

	@Override
	public MemberVO selectMemById(String mId) {
		return sqlSession.selectOne(namespace + ".selectMemById", mId);
	}

	@Override
	public List<MemberVO> searchList(SearchCriteria cri, int memCode, int state) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("DAO CRI->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + cri);
		map.put("cri", cri);
		map.put("memCode", memCode);
		map.put("state", state);
		
		return sqlSession.selectList(namespace + ".searchList", map);
	}

	@Override
	public int getMemCntByCode(SearchCriteria cri, int memCode, int state) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("memCode", memCode);
		map.put("state", state);
		
		return sqlSession.selectOne(namespace + ".getMemCntByCode", map);
	}

	
	
	/* ------------ [NON-MEMBER] ------------ */

}// MemberDAOImpl
