package edu.kh.nndr.setting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.setting.model.service.SettingService;

@Controller
@RequestMapping("/setting")
@SessionAttributes("loginMember")
public class SettingController {

	@Autowired
	private SettingService service;
	
	
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
		
		return service.changeMemberInfo(member);
	}
}
