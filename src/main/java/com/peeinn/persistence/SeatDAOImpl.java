package com.peeinn.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.SeatVO;

@Repository
public class SeatDAOImpl implements SeatDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.SeatMapper";
	
	@Override
	public void insertSt(SeatVO st) {
		sqlSession.insert(namespace + ".insertSt", st);
	}

	@Override
	public void updateSt(SeatVO st) {
		sqlSession.update(namespace + ".updateSt", st);
	}

	@Override
	public List<SeatVO> selectStList() {
		return sqlSession.selectList(namespace + ".selectList");
	}

	@Override
	public void deleteSt(int thNo) {
		sqlSession.delete(namespace + ".deleteSt", thNo);
	}

	@Override
	public List<SeatVO> selectStListByThNo(int thNo) {
		return sqlSession.selectList(namespace + ".selectListByThNo", thNo);
	}

	@Override
	public void udpateStState(SeatVO st) {
		sqlSession.update(namespace + ".updateStState" + st);
	}

}//SeatDAOImpl
