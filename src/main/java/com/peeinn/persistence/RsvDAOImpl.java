package com.peeinn.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.org.RsvLogsVO;
import com.peeinn.domain.org.RsvResultVO;

@Repository
public class RsvDAOImpl implements RsvDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.RsvMapper";

	/* RSV PART */
	@Override
	public void insertRsv(RsvVO rsv) {
		sqlSession.insert(namespace + ".insertRsv", rsv);
	}

	@Override
	public void cancelRsv(int rsvNo) {
		sqlSession.update(namespace + ".cancelRsv", rsvNo);
	}

	@Override
	public List<RsvResultVO> selectRsvList() {
		return sqlSession.selectList(namespace + ".selectRsvList");
	}
	
	@Override
	public RsvResultVO selectRsv(int rsvNo) {
		return sqlSession.selectOne(namespace + ".selectRsv", rsvNo);
	}


	/* PAY PART */
	@Override
	public void insertPay(PayVO pay) {
		sqlSession.insert(namespace + ".insertPay", pay);
	}

	@Override
	public void cancelPay(int rsvNo) {
		sqlSession.update(namespace + ".cancelPay", rsvNo);
	}

	@Override
	public List<PayVO> selectPayList() {
		return sqlSession.selectList(namespace + ".selectPayList");
	}

	
	/* RSV INFO PART */
	@Override
	public void insertRsvInfo(int rsvNo, int orgNo, int stNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rsvNo", rsvNo);
		map.put("orgNo", orgNo);
		map.put("stNo", stNo);

		sqlSession.insert(namespace + ".insertRsvInfo", map);
	}

	@Override
	public void deleteRsvInfo(int rsvNo) {
		sqlSession.delete(namespace + ".deleteRsvInfo", rsvNo);
	}

	@Override
	public List<RsvResultVO> selectRsvListBymNo(int mNo, int fDate) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mNo", mNo);
		map.put("fDate", fDate);
		
		return sqlSession.selectList(namespace + ".selectRsvListBymNo", map);
	}

	@Override
	public List<String> selectRsvedSeatList(int rsvNo) {
		return sqlSession.selectList(namespace + ".selectRsvedSeatList", rsvNo);
	}

	
	/* RSV LOGS */
	@Override
	public void insertRsvLogs(RsvLogsVO rl) {
		sqlSession.insert(namespace + ".insertRsvLogs", rl);
	}

	@Override
	public void cancelRsvLogs(int rsvNo) {
		sqlSession.update(namespace + ".cancelRsvLogs", rsvNo);
	}

	@Override
	public List<RsvLogsVO> selectRsvLogs(int mNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mNo", mNo);
		
		return sqlSession.selectList(namespace + ".selectRsvLogs", map);
	}


}//RsvDAOImpl
