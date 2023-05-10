package edu.kh.nndr.personalFeed.controller;

import java.net.http.HttpClient.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.service.MemberInfoService;
import edu.kh.nndr.member.model.service.MemberService;


@SessionAttributes("loginMember")
@Controller
public class PersonalFeedController {
	
	@Autowired
	MemberInfoService service;

	@RequestMapping("/personalFeed/{no}")
	public String personalFeed( Model model, @PathVariable("no") int no) {
		MemberInfo infoMember = service.personalMember(no);
		model.addAttribute("infoMember", infoMember); // request scope
		return "personalFeed/personalFeed";
	}
	
	
	@PostMapping("/infoIntro")
	public String infoIntro(MemberInfo member, @SessionAttribute("loginMember") MemberInfo loginMember, RedirectAttributes ra) {
		System.out.println("aaaa");
		member.setMemberNo(loginMember.getMemberNo());
		int result = service.infoIntro(member);
		if(result > 0) {// 성공
		} else { // 실패
		}
		return "redirect:/";
	}
	
	
}




