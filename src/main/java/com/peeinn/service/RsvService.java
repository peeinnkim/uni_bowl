package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.org.RsvLogsVO;
import com.peeinn.domain.org.RsvResultVO;
import com.peeinn.domain.paging.StateCriteria;

public interface RsvService {
	
	/* RSV PART */
	public int registRsv(RsvVO rsv, PayVO pay, RsvLogsVO rl);
	public void cancelRsv(int rsvNo);
	
	public List<RsvResultVO> rsvList();
	public List<RsvResultVO> rsvListBymNo(int mNo, int fDate);
	
	public List<RsvLogsVO> rsvLogsBymNo(int mNo, StateCriteria cri);
	public int rsvLogsBymNoCnt(int mNo);

	public List<String> rsvedSeatList(int rsvNo);
	
	public RsvResultVO rsvSearch(int rsvNo);
	
	/* PAY PART */
	public List<PayVO> payList();
	public List<Integer> payChartList(int year);
	
}//RsvService
