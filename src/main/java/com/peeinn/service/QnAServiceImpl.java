package com.peeinn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peeinn.domain.QnAAttachVO;
import com.peeinn.domain.QnAVO;
import com.peeinn.domain.paging.SearchCriteria;
import com.peeinn.persistence.QnADAO;
import com.peeinn.persistence.ReplyDAO;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO dao;
	@Autowired
	private ReplyDAO rpDao;
	
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

	@Override
	@Transactional
	public void modify(QnAVO qna, String[] delFiles) {
		//db에서 사진 삭제
		if(delFiles != null) {
			for(String file : delFiles) {
				dao.deleteAttachByName(file, qna.getQnaNo());
			}
		}
		
		//db에 새로 추가할 file 넣음
		for(QnAAttachVO qa : qna.getFiles()) {
			qa.setQnaNo(qna.getQnaNo());
			dao.insertQnaAttach(qa);
		}
		dao.updateQnA(qna);
	}

	@Override
	@Transactional
	public void remove(int qnaNo) {
		rpDao.deleteReplyBtQnaNo(qnaNo);
		dao.deleteQnAAttach(qnaNo);
		dao.deleteQnA(qnaNo);
	}

	@Override
	public int listSearchCnt(SearchCriteria cri) {
		return dao.listSearchCnt(cri);
	}

	@Override
	public List<Integer> listCateCnt() {
		return dao.selectQnACate();
	}

}//QnAServiceImpl
