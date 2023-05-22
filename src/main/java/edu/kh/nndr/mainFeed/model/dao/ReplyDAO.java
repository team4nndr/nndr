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
	
	/**
	 * 댓글 작성
	 * @param reply
	 * @return result
	 */
	public int submit(Reply reply) {
		return sqlSession.insert("replyMapper.submit", reply);
	}

	/**
	 * 게시글 댓글 목록 조회
	 * @param boardNo
	 * @return replyList
	 */
	public List<Reply> replyList(int boardNo) {
		return sqlSession.selectList("replyMapper.replyList", boardNo);
	}

	/**
	 * 게시글 삭제 시 관련 댓글 모두 삭제
	 * @param boardNo
	 * @return result
	 */
	public int deleteAll(int boardNo) {
		return sqlSession.update("replyMapper.deleteAll", boardNo);
	}

	/**
	 * 댓글 삭제(대댓글도 삭제)
	 * @param replyNo
	 * @return result
	 */
	public int delete(int replyNo) {
		return sqlSession.update("replyMapper.delete", replyNo);
	}

	/**
	 * 댓글 정보 조회
	 * @param replyNo
	 * @return Reply
	 */
	public Reply info(int replyNo) {
		return sqlSession.selectOne("replyMapper.info", replyNo);
	}

	/**
	 * 댓글 수정
	 * @param reply
	 * @return result
	 */
	public int update(Reply reply) {
		return sqlSession.update("replyMapper.update", reply);
	}

	/**
	 * 댓글 갯수 조회
	 * @param boardNo
	 * @return count
	 */
	public int count(int boardNo) {
		return sqlSession.delete("replyMapper.count", boardNo);
	}
}
