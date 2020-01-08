package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.QnAVO;
import com.peeinn.domain.paging.SearchCriteria;

public interface QnAService {
	
	public void regist(QnAVO qna);
	
	public List<QnAVO> list();
	public List<QnAVO> listSearch(SearchCriteria cri);

	public QnAVO read(int qnaNo);
	
	public int qnaCnt();
	
}//QnAService
