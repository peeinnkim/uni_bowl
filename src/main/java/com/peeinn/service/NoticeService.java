package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.NoticeVO;
import com.peeinn.domain.paging.SearchCriteria;

public interface NoticeService {

	public void registNotice(NoticeVO nt);
	public void modifyNotice(NoticeVO nt, String[] delFiles);
	public void removeNotice(int ntNo);
	
	public NoticeVO read(int ntNo);

	public List<NoticeVO> list();
	public List<NoticeVO> listSearch(SearchCriteria cri);

	public int listCnt();
	public int listSearchCnt(SearchCriteria cri);
	
}//NoticeService
