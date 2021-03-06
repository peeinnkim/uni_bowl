package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.QnAReplyVO;

public interface ReplyDAO {

	public void insertReply(QnAReplyVO rp);
	public void updateReply(QnAReplyVO rp);
	public void deleteReply(int rpNo);
	public void deleteReplyBtQnaNo(int qnaNo);
	
	public List<QnAReplyVO> selectReplyList();
	public List<QnAReplyVO> selectReplyByQnaNo(int qnaNo);

	public int getTotalReplyCnt();

}//ReplyDAO
