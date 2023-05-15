package edu.kh.nndr.personalFeed.controller;

import java.net.http.HttpClient.Redirect;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.service.MemberInfoService;
import edu.kh.nndr.member.model.service.MemberService;


@SessionAttributes("loginMember")
@Controller
public class PersonalFeedController {
	
	@Autowired
	MemberInfoService service;

	@GetMapping("/personalFeed/{no:[0-9]+}")
	public String personalFeed( Model model, @PathVariable("no") int no) {
		MemberInfo infoMember = service.personalMember(no);
		model.addAttribute("infoMember", infoMember); // request scope
		// 취미 목록 조회 서비스 호출
		Map<String, Object> HobbyMap = service.selectHobbyList(no); 
				
		// 조회 결과를 request scope에 세팅 후 forward
		model.addAttribute("HobbyMap", HobbyMap);
		return "personalFeed/personalFeed";
	}
	
	
	@GetMapping("/personalFeed/infoIntro")
	public String infoIntro(MemberInfo member, @SessionAttribute("loginMember") Member loginMember, @RequestHeader(value = "referer") String referer, RedirectAttributes ra) {
		member.setMemberNo(loginMember.getMemberNo());
		System.out.println(member.getMemberNo());
		int result = service.infoIntro(member);
		String path = "redirect:";
		if(result > 0) {// 성공
		} else { // 실패
		}
		path += referer;
		return path;
	}
	
//	@GetMapping("/personalFeed/infoHobby")
//	public String infoIntro(MemberInfo member, @SessionAttribute("loginMember") Member loginMember, @RequestHeader(value = "referer") String referer, RedirectAttributes ra) {
//		member.setMemberNo(loginMember.getMemberNo());
//		System.out.println(member.getMemberNo());
//		int result = service.infoIntro(member);
//		String path = "redirect:";
//		if(result > 0) {// 성공
//		} else { // 실패
//		}
//		path += referer;
//		return path;
//	}
	
	
	
	
	
	
}




