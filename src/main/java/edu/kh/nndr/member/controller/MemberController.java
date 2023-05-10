package edu.kh.nndr.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.service.MemberService;

@SessionAttributes({"loginMember"})
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	// 로그인 기능 임시 구현
	@PostMapping("/login")
	public String login(String memberEmail, String memberPw, Model model) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberEmail", memberEmail);
		map.put("memberPw", memberPw);
		Member loginMember = service.login(map);
		model.addAttribute("loginMember", loginMember);
		
		if(loginMember == null) {
			return "redirect:/";
		}
		
//		return "/member/login";
		return "redirect:/mainFeed";
	}
}