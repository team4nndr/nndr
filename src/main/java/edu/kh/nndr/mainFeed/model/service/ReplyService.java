package edu.kh.nndr.mainFeed.model.service;

import java.util.List;

import edu.kh.nndr.mainFeed.model.dto.Reply;

public interface ReplyService {

	/**
	 * 댓글 등록
	 * @param reply
	 * @return result
	 */
	int submit(Reply reply);

	/**
	 * 댓글 조회
	 * @return replyList
	 */
	List<Reply> replyList(int boardNo);
	
	/**
	 * 게시글 삭제 시 종속된 댓글 모두 삭제
	 * @return result
	 */
	int deleteReplyAll(int boardNo);

	/**
	 * 댓글 삭제(대댓글도 삭제)
	 * @param replyNo
	 * @return result
	 */
	int delete(int replyNo);

	/**
	 * 댓글 정보 조회
	 * @param replyNo
	 * @return Reply
	 */
	Reply info(int replyNo);

	/**
	 * 댓글 수정
	 * @param reply
	 * @return result
	 */
	int update(Reply reply);
	
	/**
	 * 댓글 갯수 조회
	 * @param boardNo
	 * @return count
	 */
	public int count(int boardNo);
}
