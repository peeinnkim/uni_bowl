package com.peeinn.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.SeatVO;
import com.peeinn.domain.org.StInfoVO;

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
	public void changeStState(SeatVO st) {
		sqlSession.update(namespace + ".changeStState", st);
	}

	@Override
	public List<SeatVO> selectStListByThNo(int thNo) {
		return sqlSession.selectList(namespace + ".selectListByThNo", thNo);
	}

	@Override
	public List<StInfoVO> selectListByThAndOrg(int thNo, int orgNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("thNo", thNo);
		map.put("orgNo", orgNo);
		
		List<StInfoVO> list = sqlSession.selectList(namespace + ".selectListByThAndOrg", map);
		System.out.println("DAO LIST ->>>>>>" + list);
		
		return list;
	}

}//SeatDAOImpl
