package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.QnAVO;

public interface QnAService {
	
	public void regist(QnAVO qna);
	
	public List<QnAVO> list();
	
	public int qnaCnt();
	
}//QnAService
