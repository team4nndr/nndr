package edu.kh.nndr.personalFeed.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.service.MemberInfoService;
import edu.kh.nndr.member.model.service.MemberService;

@Controller
public class PersonalFeedPicController {
	
	@Autowired
	MemberInfoService service;

	@GetMapping("/personalFeedPic/{no}")
	public String personalFeedPic( Model model, @PathVariable("no") int no) {
		MemberInfo infoMember = service.personalMember(no);
		model.addAttribute("infoMember", infoMember); // request scope
		List<Map<String, String>> imgSet = service.imgSet(no);
		model.addAttribute("imgSet", imgSet);
		return "personalFeed/personalFeedPic";
	}
}