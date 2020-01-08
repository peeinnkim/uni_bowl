package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.QnAAttachVO;
import com.peeinn.domain.QnAVO;
import com.peeinn.domain.paging.SearchCriteria;

public interface QnADAO {

	public void insertQnA(QnAVO qna);
	public void insertQnaAttach(QnAAttachVO qa);
	
	public List<QnAVO> selectQnAList();
	public List<QnAVO> listSearch(SearchCriteria cri);

	public QnAVO selectQnA(int qnaNo);
	
	public int getTotalQnACnt();
	
}//QnADAO
