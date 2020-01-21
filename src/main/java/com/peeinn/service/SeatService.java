package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.SeatVO;
import com.peeinn.domain.org.StInfoVO;

public interface SeatService {

	public void regist(List<SeatVO> stList);
	public void modify(SeatVO st);
	
	public List<SeatVO> list();
	public List<SeatVO> listByThNo(int thNo);
	public List<StInfoVO> listByThAndOrg(int thNo, int orgNo);
	
}//SeatService
