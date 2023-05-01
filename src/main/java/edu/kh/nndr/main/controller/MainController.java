package edu.kh.nndr.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/")
	public String mainForward(Model model) {
		Member testMember = service.test();
		model.addAttribute("testMember", testMember); // request scope
		return "member/login";
	}
}