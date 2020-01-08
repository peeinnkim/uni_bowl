package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peeinn.domain.NoticeAttachVO;
import com.peeinn.domain.NoticeVO;
import com.peeinn.domain.paging.SearchCriteria;
import com.peeinn.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDAO dao;

	@Override
	@Transactional
	public void registNotice(NoticeVO nt) {
		dao.insertNotice(nt);
		
		for(NoticeAttachVO na : nt.getFiles()) {
			na.setNtNo(nt.getNtNo());
			dao.insertNoticeAttach(na);
		}
	}

	@Override
	public List<NoticeVO> list() {
		return dao.selectList();
	}

	@Override
	public int listCnt() {
		return dao.noticeCnt();
	}

	@Override
	public NoticeVO read(int ntNo) {
		return dao.selectNotice(ntNo);
	}

	@Override
	public void modifyNotice(NoticeVO nt, String[] delFiles) {
		//db에 삭제
		if(delFiles != null) {
			for(String file : delFiles) {
				dao.deleteAttachByName(file, nt.getNtNo());
			}
		}
		
		//db에 새로 추가할 file 넣음
		for(NoticeAttachVO na : nt.getFiles()) {
			na.setNtNo(nt.getNtNo());
			dao.insertNoticeAttach(na);
		}
		dao.updateNotice(nt);
	}

	@Override
	public void removeNotice(int ntNo) {
		dao.deleteNoticeAttach(ntNo);
		dao.deleteNotice(ntNo);
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) {
		return dao.listSearch(cri);
	}
	

}
