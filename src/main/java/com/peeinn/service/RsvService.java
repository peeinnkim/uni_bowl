package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.org.RsvResultVO;

public interface RsvService {
	
	public int registRsv(RsvVO rsv, PayVO pay);
	public void cancelRsv(int rsvNo);
	
	public List<RsvResultVO> list();
	public List<RsvResultVO> listByMemNo(int memNo);
	
	public RsvResultVO search(int rsvNo);
	
}//RsvService
