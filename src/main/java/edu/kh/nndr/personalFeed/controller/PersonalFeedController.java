package edu.kh.nndr.personalFeed.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.service.MemberService;



@Controller
public class PersonalFeedController {
	
	@Autowired
	MemberService service;

	@RequestMapping("/personalFeed")
	public String personalFeed( Model model ) {
		Member testMember = service.test();
		model.addAttribute("testMember", testMember); // request scope
		return "personalFeed/personalFeed";
	}
}




