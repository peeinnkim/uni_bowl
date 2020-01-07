package com.peeinn.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.QnAVO;

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
	public List<QnAVO> selectQnAList() {
		return sqlSession.selectList(namespace + ".selectQnAList");
	}

	@Override
	public int getTotalQnACnt() {
		return sqlSession.selectOne(namespace + ".getTotalQnACnt");
	}

}
