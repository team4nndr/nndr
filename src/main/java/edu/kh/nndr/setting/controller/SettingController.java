package edu.kh.nndr.setting.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	
	// 현재 비밀번호 일치여부 확인
	@PostMapping("/checkPasswd")
	@ResponseBody
	public boolean checkPasswd(
			@RequestBody String curPasswd,
			@SessionAttribute("loginMember") Member loginMember) {
		
		Member member = new Member();
		member.setMemberNo(loginMember.getMemberNo());
		member.setMemberPw(curPasswd);
		
		return service.checkPasswd(member);
	}
	
	// 비밀번호 변경
	@PostMapping("/change/passwd")
	@ResponseBody
	public int changeMemberPasswd(
			@RequestBody String passwd,
			@SessionAttribute("loginMember") Member loginMember) {
		
		Member member = new Member();
		member.setMemberNo(loginMember.getMemberNo());
		member.setMemberPw(passwd);
		
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
	
	//
	@GetMapping("/change/set")
	@ResponseBody
	public int changeSetting(
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap, SessionStatus status, Model model) {
//			@RequestParam("key") String key,
//			@RequestParam("value") String value) {
		
//		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("key", key);
//		paramMap.put("value", value);

//		paramMap.put("memberNo", loginMember.getMemberNo());
		
//		return 0;
		
		int result = service.changeSetting(paramMap, loginMember);
		
		if(result > 0) {
//			status.setComplete();
//			loginMember = userService.selectMember(loginMember.getMemberNo());
			model.addAttribute("loginMember", userService.selectMember(loginMember.getMemberNo()));
		}
	
		return result;
	}
}
