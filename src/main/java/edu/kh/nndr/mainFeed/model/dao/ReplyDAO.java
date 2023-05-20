package edu.kh.nndr.mainFeed.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.mainFeed.model.dto.Reply;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int submit(Reply reply) {
		return sqlSession.insert("replyMapper.submit", reply);
	}

	public List<Reply> replyList(int boardNo) {
		return sqlSession.selectList("replyMapper.replyList", boardNo);
	}

	public int deleteReplyAll(int boardNo) {
		return sqlSession.delete("replyMapper.deleteReplyAll", boardNo);
	}
}
