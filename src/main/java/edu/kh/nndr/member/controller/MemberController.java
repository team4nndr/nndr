package edu.kh.nndr.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.service.MemberService;

@SessionAttributes({"loginMember"})
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	// 로그인 기능 임시 구현
	@PostMapping("/login")
	public String login(String memberEmail, String memberPw, 
			Model model, RedirectAttributes ra) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberEmail", memberEmail);
		map.put("memberPw", memberPw);
		Member loginMember = service.login(map);
		model.addAttribute("loginMember", loginMember);
		
		// 로그인 실패
		if(loginMember == null) {
			ra.addFlashAttribute("message", "아이디 또는 비밀번호를 확인해 주세요.");
			return "redirect:/";
		}
	
		// 관리자 로그인일 경우
		if(loginMember.getMemberCode().equals("A")) {
			return "redirect:/admin";
		}	
		
		return "redirect:/mainFeed";
	}
	
	// 회원 가입 진행
	@PostMapping("/")
	public String signUp(Member inputMember , RedirectAttributes ra){
							
		String path = "redirect:/";
		String message = null;
		
		int result = service.signUp(inputMember);
		
		
		if(result > 0) { // 가입 성공
			
			message = inputMember.getMemberName() + "야  nndr은 처음이지 ?.";
					
		}else { // 가입 실패
			
			message = "회원 가입 실패";
		
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	
	
	
}