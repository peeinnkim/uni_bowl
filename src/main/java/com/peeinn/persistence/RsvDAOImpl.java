package com.peeinn.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.org.RsvResultVO;

@Repository
public class RsvDAOImpl implements RsvDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.RsvMapper";

	@Override
	public void insertRsv(RsvVO rsv) {
		sqlSession.insert(namespace + ".insertRsv", rsv);
	}

	@Override
	public void cancelRsv(int rsvNo) {
		sqlSession.update(namespace + ".cancelRsv", rsvNo);
	}

	@Override
	public void insertRsvStInfo(int stNo, int rsvNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stNo", stNo);
		map.put("rsvNo", rsvNo);
		
		sqlSession.insert(namespace + ".insretRsvStInfo", map);
	}

	@Override
	public void insertPay(PayVO pay) {
		sqlSession.insert(namespace + ".insertPay", pay);
	}

	@Override
	public void cancelPay(int rsvNo) {
		sqlSession.update(namespace + ".cancelPay", rsvNo);
	}

	@Override
	public List<RsvResultVO> selectList() {
		return sqlSession.selectList(namespace + ".selectList");
	}

	@Override
	public List<RsvResultVO> selectListByMemNo(int memNo) {
		return sqlSession.selectList(namespace + ".selectList", memNo);
	}

	@Override
	public RsvResultVO selectRsv(int rsvNo) {
		return sqlSession.selectOne(namespace + ".selectRsv", rsvNo);
	}

}
