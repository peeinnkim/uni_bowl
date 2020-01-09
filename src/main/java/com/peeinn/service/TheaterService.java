package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.TheaterVO;

public interface TheaterService {
	
	public void regist(TheaterVO th);
	
	public List<TheaterVO> list();
	
}//TheaterService
