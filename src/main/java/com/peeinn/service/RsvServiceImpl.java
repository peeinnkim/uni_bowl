package com.peeinn.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.SeatVO;
import com.peeinn.domain.org.OrgResultVO;
import com.peeinn.domain.org.RsvResultVO;
import com.peeinn.persistence.RsvDAO;

@Service
public class RsvServiceImpl implements RsvService {

	@Autowired
	private RsvDAO dao;

	/* RSV PART */
	@SuppressWarnings("unchecked")
	@Override
	public int registRsv(RsvVO rsv, PayVO pay) {
		dao.insertRsv(rsv);
		pay.setPyRsvNo(rsv.getRsvNo());
		dao.insertPay(pay);

		Map<String, Object> map = rsv.getRsvInfoMap();	
		List<SeatVO> seatList = (List<SeatVO>) map.get("seatList");
		OrgResultVO ores = (OrgResultVO) map.get("ores");
		
		for(SeatVO st : seatList) {
			dao.insertRsvInfo(rsv.getRsvNo(), ores.getOrg().getOrgNo(), st.getStNo());
		}
		
		return rsv.getRsvNo();
	}

	@Override
	public void cancelRsv(int rsvNo) {
		dao.cancelPay(rsvNo);
		dao.cancelRsv(rsvNo);
	}

	@Override
	public List<RsvVO> rsvList() {
		return dao.selectRsvList();
	}
	
	@Override
	public RsvResultVO rsvSearch(int rsvNo) {
		return dao.selectRsv(rsvNo);
	}

	
	/* PAY PART */
	@Override
	public List<PayVO> payList() {
		return dao.selectPayList();
	}



}
