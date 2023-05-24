package edu.kh.nndr.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.alarm.model.dto.Alarm;
import edu.kh.nndr.friend.model.sevice.FriendService;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.service.MemberService;
import edu.kh.nndr.topMenu.service.TopMenuService;

@SessionAttributes({"loginMember", "friendList","alarmList"})
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private FriendService friendService;
	@Autowired
	private TopMenuService topMenuService;

	// 로그인 기능 
	@PostMapping("/login")
	public String login(String memberEmail, String memberPw, 
			Model model, HttpServletResponse resp ,RedirectAttributes ra) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberEmail", memberEmail);
		map.put("memberPw", memberPw);
		Member loginMember = service.login(map);
		
		String path = "redirect:/";
		
		// 로그인 성공
		if(loginMember != null) {

			// 세션 데이터 설정
			model.addAttribute("loginMember", loginMember); // 로그인 유저 정보
			List<Member> friendList = friendService.friendListMember(loginMember.getMemberNo());
			model.addAttribute("friendList", friendList); // 현재 친구 목록
			List<Alarm> alarmList = topMenuService.alarmList(loginMember.getMemberNo());
			model.addAttribute("alarmList",alarmList); // 현재 알람 목록
			
			Cookie cookie = new Cookie("map", loginMember.getMemberEmail());
			
			if(loginMember != null) {
				cookie.setMaxAge(60*60*24*30);
			} 
			cookie.setPath("/");
			resp.addCookie(cookie);
			path += "mainFeed";
		
		// 로그인 실패
		} else {
			
			ra.addFlashAttribute("message", "아이디 또는 비밀번호를 확인해 주세요.");
		}
	
		return path;
	}
	
	
	// 회원 가입 진행
	@PostMapping("/")
	public String signUp(Member inputMember, RedirectAttributes ra) {

		String path = "redirect:/";
		String message = null;

		int result = service.signUp(inputMember);

		if (result > 0) { // 가입 성공

			message = inputMember.getMemberName() + "야  nndr은 처음이지 ?.";

		} else { // 가입 실패

			message = "회원 가입 실패";

		}

		ra.addFlashAttribute("message", message);

		return path;
	}

}