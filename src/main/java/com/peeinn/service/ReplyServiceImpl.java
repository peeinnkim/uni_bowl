package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peeinn.domain.QnAReplyVO;
import com.peeinn.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	@Override
	public void regist(QnAReplyVO rp) {
		dao.insertReply(rp);
	}

	@Override
	public void modify(QnAReplyVO rp) {
		dao.updateReply(rp);
	}

	@Override
	public void remove(int rpNo) {
		dao.deleteReply(rpNo);
	}

	@Override
	public List<QnAReplyVO> list() {
		return dao.selectReplyList();
	}

	@Override
	public List<QnAReplyVO> listByQnaNo(int qnaNo) {
		return dao.selectReplyByQnaNo(qnaNo);
	}

	@Override
	public int replyCnt() {
		return dao.getTotalReplyCnt();
	}
	
}//ReplyServiceImpl
