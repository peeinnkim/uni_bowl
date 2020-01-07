package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peeinn.domain.QnAVO;
import com.peeinn.persistence.QnADAO;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO dao;
	
	@Override
	public void regist(QnAVO qna) {
		dao.insertQnA(qna);
	}

	@Override
	public List<QnAVO> list() {
		return dao.selectQnAList();
	}

	@Override
	public int qnaCnt() {
		return dao.getTotalQnACnt();
	}

}//QnAServiceImpl
