package edu.kh.nndr.mainFeed.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.mainFeed.model.dto.Reply;
import edu.kh.nndr.mainFeed.model.service.ReplyService;
import edu.kh.nndr.member.model.dto.Member;

@Controller
@RequestMapping("/reply")
@SessionAttributes("{loginMember}")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	// 댓글 조회
	@GetMapping("")
	@ResponseBody
	public List<Reply> replyList(int boardNo) {
		return service.replyList(boardNo);
	}
	
	// 댓글 등록
	@PostMapping("/submit")
	@ResponseBody
	public int submit(
			@RequestBody Reply reply,
			@SessionAttribute("loginMember") Member loginMember) {

		reply.setMemberNo(loginMember.getMemberNo());
		return service.submit(reply);
	}
	
	// 댓글 삭제
	@GetMapping("/delete")
	@ResponseBody
	public int delete(@RequestParam int replyNo) {
		return service.delete(replyNo);
	}
	
	// 댓글 정보 조회
	@GetMapping("/info")
	@ResponseBody
	public Reply info(@RequestParam int replyNo) {
		System.out.println(replyNo);
		System.out.println(service.info(replyNo));
		return service.info(replyNo);
	}
}
