package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.QnAAttachVO;
import com.peeinn.domain.QnAVO;
import com.peeinn.domain.paging.SearchCriteria;

public interface QnADAO {

	public void insertQnA(QnAVO qna);
	public void insertQnaAttach(QnAAttachVO qa);
	public void updateQnA(QnAVO qna);
	public void deleteQnA(int qnaNo);
	public void deleteQnAAttach(int qnaNo);
	public void deleteAttachByName(String name, int qnaNo);
	
	public QnAVO selectQnA(int qnaNo);

	public List<QnAVO> selectQnAList();
	public List<QnAVO> listSearch(SearchCriteria cri);

	public int getTotalQnACnt();
	public int listSearchCnt(SearchCriteria cri);
	
}//QnADAO
