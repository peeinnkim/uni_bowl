package com.peeinn.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void updateQnA(QnAVO qna) {
		sqlSession.update(namespace + ".updateQnA", qna);
	}

	@Override
	public void deleteQnA(int qnaNo) {
		sqlSession.delete(namespace + ".deleteQnA", qnaNo);
	}

	@Override
	public void deleteQnAAttach(int qnaNo) {
		sqlSession.delete(namespace + ".deleteQnAAttach", qnaNo);
	}

	@Override
	public void deleteAttachByName(String name, int qnaNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("qnaNo", qnaNo);

		sqlSession.delete(namespace + ".deleteAttachByName", map);
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
	public List<QnAVO> listSearch(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}
	
	@Override
	public int getTotalQnACnt() {
		return sqlSession.selectOne(namespace + ".getTotalQnACnt");
	}

	@Override
	public int listSearchCnt(SearchCriteria cri) {
		return sqlSession.selectOne(namespace + ".listSearchCnt", cri);
	}

}// QnADAOImpl
