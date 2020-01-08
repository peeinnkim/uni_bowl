package com.peeinn.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.QnAAttachVO;
import com.peeinn.domain.QnAVO;
import com.peeinn.domain.paging.SearchCriteria;

@Repository
public class QnADAOImpl implements QnADAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.QnAMapper";
	
	@Override
	public void insertQnA(QnAVO qna) {
		sqlSession.insert(namespace + ".insertQnA", qna);
	}

	@Override
	public void insertQnaAttach(QnAAttachVO qa) {
		sqlSession.insert(namespace + ".insertQnaAttach", qa);
	}

	@Override
	public List<QnAVO> selectQnAList() {
		return sqlSession.selectList(namespace + ".selectQnAList");
	}
	
	@Override
	public QnAVO selectQnA(int qnaNo) {
		return sqlSession.selectOne(namespace + ".selectQnA", qnaNo);
	}

	@Override
	public int getTotalQnACnt() {
		return sqlSession.selectOne(namespace + ".getTotalQnACnt");
	}

	@Override
	public List<QnAVO> listSearch(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}

}
