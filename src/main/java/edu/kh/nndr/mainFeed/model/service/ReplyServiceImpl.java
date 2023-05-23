package edu.kh.nndr.mainFeed.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.common.utility.Util;
import edu.kh.nndr.mainFeed.model.dao.ReplyDAO;
import edu.kh.nndr.mainFeed.model.dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	// 댓글 등록
	@Override
	public int submit(Reply reply) {
		reply.setReplyContent(Util.XSSHandlingReply(reply.getReplyContent())); // XSS 방지 처리
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
		
		// 게시글에 달린 댓글이 없는 경우 1(sql 정상수행 응답) 반환
		if(dao.count(boardNo) == 0) return 1;
		return dao.deleteAll(boardNo);
	}

	// 댓글 삭제(대댓글도 삭제)
	@Override
	public int delete(int replyNo) {
		return dao.delete(replyNo);
	}

	// 댓글 정보 조회
	@Override
	public Reply info(int replyNo) {
		return dao.info(replyNo);
	}

	// 댓글 수정
	@Override
	public int update(Reply reply) {
		reply.setReplyContent(Util.XSSHandlingReply(reply.getReplyContent())); // XSS 방지 처리
		return dao.update(reply);
	}
	
	// 특정 게시글 댓글 갯수 조회
	@Override
	public int count(int boardNo) {
		return dao.count(boardNo);
	}
}
