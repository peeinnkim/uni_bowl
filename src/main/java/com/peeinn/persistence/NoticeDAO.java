package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.NoticeAttachVO;
import com.peeinn.domain.NoticeVO;
import com.peeinn.domain.paging.SearchCriteria;

public interface NoticeDAO {
	
	public void insertNotice(NoticeVO nt);
	public void insertNoticeAttach(NoticeAttachVO na);
	public void updateNotice(NoticeVO nt);
	public void deleteNotice(int ntNo);
	public void deleteNoticeAttach(int ntNo);
	public void deleteAttachByName(String name, int ntNo);
	
	public NoticeVO selectNotice(int ntNo);

	public List<NoticeVO> selectList();
	public List<NoticeVO> listSearch(SearchCriteria cri);
	
	public int noticeCnt();
	
}//NoticeDAO
