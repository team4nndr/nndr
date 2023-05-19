package edu.kh.nndr.mainFeed.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping("")
	@ResponseBody
	public List<Reply> replyList(int boardNo) {
		return service.replyList(boardNo);
	}
	
	@PostMapping("/submit")
	@ResponseBody
	public int submit(
			@RequestBody Reply reply,
			@SessionAttribute("loginMember") Member loginMember) {
		reply.setMemberNo(loginMember.getMemberNo());
		System.out.println(reply);
		
		return service.submit(reply);
	}
}
