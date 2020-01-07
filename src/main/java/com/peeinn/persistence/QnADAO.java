package com.peeinn.persistence;

import java.util.List;

import com.peeinn.domain.QnAVO;

public interface QnADAO {

	public void insertQnA(QnAVO qna);
	
	public List<QnAVO> selectQnAList();
	
	public int getTotalQnACnt();
	
}//QnADAO
