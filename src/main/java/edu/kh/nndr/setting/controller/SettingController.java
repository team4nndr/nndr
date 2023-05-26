package edu.kh.nndr.setting.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.admin.controller.UserManageController;
import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.admin.model.service.UserManageService;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.setting.model.service.SettingService;

@Controller
@RequestMapping("/setting")
@SessionAttributes("loginMember")
public class SettingController {

	@Autowired
	private SettingService service;
	@Autowired
	private UserManageService userService;
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	@GetMapping("")
	public String setting() {
		return "setting/general";
	}
	
	@GetMapping("/general")
	public String general() {
		return "setting/general";
	}
	
	@GetMapping("/security")
	public String security() {
		return "setting/security";
	}
	
	@GetMapping("/alarm")
	public String alarm() {
		return "setting/alarm";
	}
	
	@GetMapping("/feedback")
	public String feedback() {
		return "setting/feedback";
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "setting/delete";
	}
	
	// 회원 의견 전송
	@PostMapping("/feedback")
	@ResponseBody
	public int feedback(@RequestBody Feedback feedback) {
		return service.feedback(feedback);
	}
	
	// 회원정보 수정(설정 페이지)
	@GetMapping("/change/info")
	@ResponseBody
	public int changeMemberInfo(
			@RequestParam("k") String key,
			@RequestParam("v") String value,
			@SessionAttribute("loginMember") Member loginMember) {
		
		switch(key) {
			case "gender": loginMember.setInfoGender(value); break;
			case "addr": loginMember.setInfoResidence(value); break;
			case "tel": loginMember.setMemberTel(value); break;
			default: return 0;
		}

		return service.changeMemberInfo(loginMember);
	}
	
	// 비밀번호 변경
	@PostMapping("/change/passwd")
	@ResponseBody
	public int changeMemberPasswd(
			@RequestBody Map<String, String> paramMap,
			@SessionAttribute("loginMember") Member loginMember) {
		
		if( !bcrypt.matches(paramMap.get("curPw"), service.getPasswd(loginMember)) ) {
			return 0;
		}
		
		Member member = new Member();
		member.setMemberNo(loginMember.getMemberNo());
		member.setMemberPw(bcrypt.encode(paramMap.get("newPw")));
		
		return service.changeMemberPasswd(member);
	}
	
	// 계정 비활성화
	@GetMapping("/disable")
	@ResponseBody
	public int disableMember(@SessionAttribute("loginMember") Member loginMember,
			SessionStatus status) {
		int result = userService.disableMember(loginMember.getMemberNo());
		status.setComplete();
		return result;
	}
	
	// 환경설정 변경
	@GetMapping("/change/set")
	@ResponseBody
	public int changeSetting(
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap, SessionStatus status, Model model) {

		int result = service.changeSetting(paramMap, loginMember);
		
		if(result > 0) {
			model.addAttribute("loginMember", userService.selectMember(loginMember.getMemberNo()));
		}
	
		return result;
	}
	
	// 계정 삭제
	@PostMapping("/delete")
	public String delete(
			@SessionAttribute("loginMember") Member loginMember,
			@RequestHeader(value="referer") String referer,
			String passwd,
			RedirectAttributes ra,
			SessionStatus status) {

		// 비밀번호 확인
//		Member member = new Member();
//		member.setMemberPw(passwd);
//		member.setMemberNo(loginMember.getMemberNo());
		
		if( !bcrypt.matches(passwd, service.getPasswd(loginMember)) ) {
			ra.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "redirect:" + referer;
		}
		
		userService.deleteMember(loginMember.getMemberNo());
		ra.addFlashAttribute("message", "탈퇴되었습니다.");
		status.setComplete();
		
		return "redirect:/";
	}
	
}
