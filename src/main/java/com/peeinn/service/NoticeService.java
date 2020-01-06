package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.NoticeVO;

public interface NoticeService {

	public void registNotice(NoticeVO nt);
	public void modifyNotice(NoticeVO nt);
	public void removeNotice(int ntNo);
	
	public NoticeVO read(int ntNo);

	public List<NoticeVO> list();

	public int listCnt();
	
}//NoticeService
