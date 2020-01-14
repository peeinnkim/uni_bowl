package com.peeinn.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.TheaterVO;

@Repository
public class TheaterDAOImpl implements TheaterDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.TheaterMapper";
	
	@Override
	public void insertTh(TheaterVO th) {
		sqlSession.insert(namespace + ".insertTh", th);
	}

	@Override
	public List<TheaterVO> selectList() {
		return sqlSession.selectList(namespace + ".selectList");
	}

	@Override
	public TheaterVO selectTh(int thNo) {
		return sqlSession.selectOne(namespace + ".selectTh", thNo);
	}

	@Override
	public void updateRowCol(TheaterVO th) {
		sqlSession.update(namespace + ".updateRowCol", th);
	}

	@Override
	public void deleteTh(int thNo) {
		sqlSession.delete(namespace + ".deleteTh", thNo);
	}

	@Override
	public TheaterVO getRowAndCol(int thNo) {
		return sqlSession.selectOne(namespace + ".getRowAndCol", thNo);
	}

}//TheaterDAOImpl
