package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.QnAReplyVO;

public interface ReplyService {

	public void	regist(QnAReplyVO rp);
	public void modify(QnAReplyVO rp);
	public void remove(int rpNo);
	
	public List<QnAReplyVO> list();
	public List<QnAReplyVO> listByQnaNo(int qnaNo);

	public int replyCnt();
	
}//ReplyService
