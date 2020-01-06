package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peeinn.domain.NoticeAttachVO;
import com.peeinn.domain.NoticeVO;
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
	public void modifyNotice(NoticeVO nt) {
		dao.updateNotice(nt);
		
		for(NoticeAttachVO na : nt.getFiles()) {
			na.setNtNo(nt.getNtNo());
			dao.insertNoticeAttach(na);
		}
	}

	@Override
	public void removeNotice(int ntNo) {
		dao.deleteNoticeAttach(ntNo);
		dao.deleteNotice(ntNo);
	}
	

}
