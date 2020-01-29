package com.peeinn.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.SeatVO;
import com.peeinn.domain.org.OrgResultVO;
import com.peeinn.domain.org.RsvLogsVO;
import com.peeinn.domain.org.RsvResultVO;
import com.peeinn.domain.paging.StateCriteria;
import com.peeinn.persistence.RsvDAO;

@Service
public class RsvServiceImpl implements RsvService {

	@Autowired
	private RsvDAO dao;

	/* RSV PART */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public int registRsv(RsvVO rsv, PayVO pay, RsvLogsVO rl) {
		dao.insertRsv(rsv);
		pay.setPyRsvNo(rsv.getRsvNo());
		dao.insertPay(pay);

		Map<String, Object> map = rsv.getRsvInfoMap();	
		List<SeatVO> seatList = (List<SeatVO>) map.get("seatList");
		OrgResultVO ores = (OrgResultVO) map.get("ores");
		
		for(SeatVO st : seatList) {
			dao.insertRsvInfo(rsv.getRsvNo(), ores.getOrg().getOrgNo(), st.getStNo());
		}
		
		rl.setRlRsvNo(rsv.getRsvNo());
		dao.insertRsvLogs(rl);
		
		return rsv.getRsvNo();
	}

	@Override
	@Transactional
	public void cancelRsv(int rsvNo) {
		dao.cancelPay(rsvNo);
		dao.cancelRsv(rsvNo);
		dao.deleteRsvInfo(rsvNo);
		dao.cancelRsvLogs(rsvNo);
	}

	@Override
	public List<RsvResultVO> rsvList() {
		return dao.selectRsvList();
	}

	@Override
	public List<RsvResultVO> rsvListBymNo(int mNo, int fDate) {
		return dao.selectRsvListBymNo(mNo, fDate);
	}
	
	@Override
	public RsvResultVO rsvSearch(int rsvNo) {
		return dao.selectRsv(rsvNo);
	}

	@Override
	public List<String> rsvedSeatList(int rsvNo) {
		return dao.selectRsvedSeatList(rsvNo);
	}
	
	@Override
	public List<RsvLogsVO> rsvLogsBymNo(int mNo, StateCriteria cri) {
		return dao.selectRsvLogs(mNo, cri);
	}
	
	/* PAY PART */
	@Override
	public List<PayVO> payList() {
		return dao.selectPayList();
	}

	@Override
	public List<Integer> payChartList(int year) {
		return dao.selectPayChartList(year);
	}

	@Override
	public int rsvLogsBymNoCnt(int mNo) {
		return dao.selectRsvLogsCnt(mNo);
	}






}
