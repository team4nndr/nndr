package edu.kh.nndr.mainFeed.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.mainFeed.model.dao.ReplyDAO;
import edu.kh.nndr.mainFeed.model.dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	// 댓글 등록
	@Override
	public int submit(Reply reply) {
		return dao.submit(reply);
	}
	
	// 댓글 조회
	@Override
	public List<Reply> replyList(int boardNo) {
		return dao.replyList(boardNo);
	}

	// 게시글 삭제 시 종속된 댓글 모두 삭제
	@Override
	public int deleteReplyAll(int boardNo) {
		return dao.deleteReplyAll(boardNo);
	}
}
