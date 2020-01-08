package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peeinn.domain.QnAAttachVO;
import com.peeinn.domain.QnAVO;
import com.peeinn.domain.paging.SearchCriteria;
import com.peeinn.persistence.QnADAO;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO dao;
	
	@Override
	@Transactional
	public void regist(QnAVO qna) {
		dao.insertQnA(qna);
		
		for(QnAAttachVO qa : qna.getFiles()) {
			qa.setQnaNo(qna.getQnaNo());
			dao.insertQnaAttach(qa);
		}
	}

	@Override
	public List<QnAVO> list() {
		return dao.selectQnAList();
	}
	
	@Override
	public QnAVO read(int qnaNo) {
		return dao.selectQnA(qnaNo);
	}

	@Override
	public int qnaCnt() {
		return dao.getTotalQnACnt();
	}

	@Override
	public List<QnAVO> listSearch(SearchCriteria cri) {
		return dao.listSearch(cri);
	}

}//QnAServiceImpl
