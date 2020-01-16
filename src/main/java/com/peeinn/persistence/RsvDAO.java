package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.org.RsvResultVO;

public interface RsvDAO {

	/* RSV PART */
	public void insertRsv(RsvVO rsv);
	public void cancelRsv(int rsvNo);
	
	public List<RsvResultVO> selectList();
	public List<RsvResultVO> selectListByMemNo(int memNo);
	
	public RsvResultVO selectRsv(int rsvNo);
	
	/* RSV-SEAT */
	public void insertRsvStInfo(int stNo, int rsvNo);
	
	/* PAY PART */
	public void insertPay(PayVO pay);
	public void cancelPay(int rsvNo);
	
}//RsvDAO
