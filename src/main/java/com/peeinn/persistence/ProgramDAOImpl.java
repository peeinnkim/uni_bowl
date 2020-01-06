package com.peeinn.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.ProgramVO;

@Repository
public class ProgramDAOImpl implements ProgramDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.ProgramMapper";
	
	@Override
	public List<ProgramVO> selectProgramList() {
		return sqlSession.selectList(namespace + ".selectPgList");
	}

	@Override
	public int getTotalPgCnt() {
		return sqlSession.selectOne(namespace + ".getTotalPgCnt");
	}

	@Override
	public void insertPg(ProgramVO pg) {
		sqlSession.insert(namespace + ".insertPg", pg);
	}

	@Override
	public ProgramVO selectPg(int pgNo) {
		return sqlSession.selectOne(namespace + ".selectPg", pgNo);
	}

	@Override
	public void updatePg(ProgramVO pg) {
		sqlSession.update(namespace + ".updatePg", pg);
	}

	@Override
	public void deletePg(int pgNo) {
		sqlSession.delete(namespace + ".deletePg", pgNo);
	}

}
