package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.org.RsvResultVO;

public interface RsvService {
	
	/* RSV PART */
	public int registRsv(RsvVO rsv, PayVO pay);
	public void cancelRsv(int rsvNo);
	
	public List<RsvVO> rsvList();
	
	public RsvResultVO rsvSearch(int rsvNo);
	
	/* PAY PART */
	public List<PayVO> payList();
	
}//RsvService
