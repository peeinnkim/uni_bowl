package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.SeatVO;
import com.peeinn.domain.org.RsvResultVO;
import com.peeinn.persistence.RsvDAO;
import com.peeinn.persistence.SeatDAO;

@Service
public class RsvServiceImpl implements RsvService {

	@Autowired
	private RsvDAO dao;
	@Autowired
	private SeatDAO stDao;

	@Override
	@Transactional
	public int registRsv(RsvVO rsv, PayVO pay) {
		dao.insertRsv(rsv);
		pay.setPyRsvNo(rsv.getRsvNo());
		dao.insertPay(pay);
		
		for(SeatVO st : rsv.getRsvSeatList()) {
			dao.insertRsvStInfo(st.getStNo(), rsv.getRsvNo());
			stDao.updateSt(st);
		}
		
		return rsv.getRsvNo();
	}

	@Override
	public void cancelRsv(int rsvNo) {
		dao.cancelPay(rsvNo);
		dao.cancelRsv(rsvNo);
	}

	@Override
	public List<RsvResultVO> list() {
		return dao.selectList();
	}

	@Override
	public List<RsvResultVO> listByMemNo(int memNo) {
		return dao.selectListByMemNo(memNo);
	}

	@Override
	public RsvResultVO search(int rsvNo) {
		return dao.selectRsv(rsvNo);
	}


}
