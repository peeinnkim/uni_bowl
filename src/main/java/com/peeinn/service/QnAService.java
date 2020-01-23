package com.peeinn.service;

import java.util.List;

import com.peeinn.domain.QnAVO;
import com.peeinn.domain.paging.SearchCriteria;

public interface QnAService {
	
	public void regist(QnAVO qna);
	public void modify(QnAVO qna, String[] delFiles);
	public void remove(int qnaNo);
	
	public QnAVO read(int qnaNo);

	public List<QnAVO> list();
	public List<QnAVO> listSearch(SearchCriteria cri);

	public List<Integer> listCateCnt();

	public int qnaCnt();
	public int listSearchCnt(SearchCriteria cri);
	
}//QnAService
