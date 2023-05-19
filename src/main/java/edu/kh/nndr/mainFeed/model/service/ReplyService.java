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

}
