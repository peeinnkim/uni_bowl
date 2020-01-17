package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.org.RsvResultVO;

public interface RsvDAO {
	
	/* RSV PART */
	public void insertRsv(RsvVO rsv);
	public void cancelRsv(int rsvNo);
	
	public List<RsvVO> selectRsvList();

	public RsvResultVO selectRsv(int rsvNo);
	
	
	/* RSV INFO PART */
	public void insertRsvInfo(int rsvNo, int orgNo, int stNo);
	
	
	/* PAY PART */
	public void insertPay(PayVO pay);
	public void cancelPay(int rsvNo);
	
	public List<PayVO> selectPayList();

	
}//RsvDAO
