package com.peeinn.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peeinn.domain.NoticeAttachVO;
import com.peeinn.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.NoticeMapper";

	@Override
	public void insertNotice(NoticeVO nt) {
		sqlSession.insert(namespace + ".insertNotice", nt);
	}

	@Override
	public void insertNoticeAttach(NoticeAttachVO na) {
		sqlSession.insert(namespace + ".insertNoticeAttach", na);
	}

	@Override
	public List<NoticeVO> selectList() {
		return sqlSession.selectList(namespace + ".selectList");
	}

	@Override
	public int noticeCnt() {
		return sqlSession.selectOne(namespace + ".noticeCnt");
	}

	@Override
	public NoticeVO selectNotice(int ntNo) {
		return sqlSession.selectOne(namespace + ".selectNotice", ntNo);
	}

	@Override
	public void updateNotice(NoticeVO nt) {
		sqlSession.update(namespace + ".updateNotice", nt);
	}

	@Override
	public void deleteNotice(int ntNo) {
		sqlSession.delete(namespace + ".deleteNotice", ntNo);
	}

	@Override
	public void deleteNoticeAttach(int ntNo) {
		sqlSession.delete(namespace + ".deleteNoticeAttach", ntNo);
	}

}
