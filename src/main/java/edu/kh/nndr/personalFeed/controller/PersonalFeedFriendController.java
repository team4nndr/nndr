package edu.kh.nndr.personalFeed.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.nndr.member.model.service.MemberService;

@Controller
public class PersonalFeedFriendController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/personalFeedFriend")
	public String personalFeedFriend() {
		return "personalFeed/personalFeedFriend";
//		return "common/error";
	}
}