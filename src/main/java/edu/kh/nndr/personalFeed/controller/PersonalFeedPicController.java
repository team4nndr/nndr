package edu.kh.nndr.personalFeed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.dto.PersonalFriend;
import edu.kh.nndr.member.model.service.MemberInfoService;
import edu.kh.nndr.member.model.service.MemberService;

@Controller
public class PersonalFeedPicController {
	
	@Autowired
	MemberInfoService service;

	@GetMapping("/personalFeedPic/{no}")
	public String personalFeedPic( Model model, @PathVariable("no") int no, @SessionAttribute("loginMember") Member loginMember) {
		MemberInfo infoMember = service.personalMember(no);
		model.addAttribute("infoMember", infoMember); // request scope
		List<MemberInfo> imgSet = service.imgSet(no);
		model.addAttribute("imgSet", imgSet);
		Map<String, Object> friendche = new HashMap<>();
		friendche.put("friendSender", loginMember.getMemberNo());
		friendche.put("friendReciver", no);
		PersonalFriend friendcheck = service.friendChecking(friendche);
		model.addAttribute("friendcheck", friendcheck);
		return "personalFeed/personalFeedPic";
	}
}