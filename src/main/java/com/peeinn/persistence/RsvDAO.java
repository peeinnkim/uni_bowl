package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.PayVO;
import com.peeinn.domain.RsvVO;
import com.peeinn.domain.org.RsvLogsVO;
import com.peeinn.domain.org.RsvResultVO;
import com.peeinn.domain.paging.StateCriteria;

public interface RsvDAO {
	
	/* RSV PART */
	public void insertRsv(RsvVO rsv);
	public void cancelRsv(int rsvNo);
	
	public List<RsvResultVO> selectRsvList();
	public List<RsvResultVO> selectRsvListBymNo(int mNo, int fDate);

	public RsvResultVO selectRsv(int rsvNo);
	
	
	/* RSV INFO PART */
	public void insertRsvInfo(int rsvNo, int orgNo, int stNo);
	public void deleteRsvInfo(int rsvNo);
	
	public List<String> selectRsvedSeatList(int rsvNo);
	public List<Integer> selectPayChartList(int year);
	
	
	/* PAY PART */
	public void insertPay(PayVO pay);
	public void cancelPay(int rsvNo);
	
	public List<PayVO> selectPayList();
	
	
	/* RSV LOGS */
	public void insertRsvLogs(RsvLogsVO rl);
	public void cancelRsvLogs(int rsvNo);
	
	public List<RsvLogsVO> selectRsvLogs(int mNo, StateCriteria cri);
	public int selectRsvLogsCnt(int mNo);

	
	
	
}//RsvDAO
