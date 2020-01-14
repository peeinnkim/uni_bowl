package com.peeinn.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.QnAReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.ReplyMapper";
	
	@Override
	public void insertReply(QnAReplyVO rp) {
		sqlSession.insert(namespace + ".insertReply", rp);
	}

	@Override
	public void updateReply(QnAReplyVO rp) {
		sqlSession.update(namespace + ".updateReply", rp);
	}

	@Override
	public void deleteReply(int rpNo) {
		sqlSession.delete(namespace + ".deleteReply", rpNo);
	}

	@Override
	public List<QnAReplyVO> selectReplyList() {
		return sqlSession.selectList(namespace + ".selectReplyList");
	}

	@Override
	public List<QnAReplyVO> selectReplyByQnaNo(int qnaNo) {
		return sqlSession.selectList(namespace + ".selectReplyByQnaNo", qnaNo);
	}

	@Override
	public int getTotalReplyCnt() {
		return sqlSession.selectOne(namespace + ".getTotalReplyCnt");
	}

	@Override
	public void deleteReplyBtQnaNo(int qnaNo) {
		sqlSession.delete(namespace + ".deleteReplyBtQnaNo", qnaNo);
	}


}
