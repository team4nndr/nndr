package edu.kh.nndr.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.admin.model.service.UserManageService;
import edu.kh.nndr.member.model.dto.Member;

@Controller
@RequestMapping("/admin/user")
@SessionAttributes("loginMember")
public class UserManageController {
	
	@Autowired
	private UserManageService service;

	// 유저 목록 조회
	@GetMapping("")
	public String selectMemberList(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			Model model) {
		Map<String, Object> map = service.selectMemberList(cp);
		model.addAttribute("map", map);
		return "admin/users";
	}
	
	// 유저 상세 조회
	@GetMapping("/{memberNo:[0-9]+}")	
	public String selectMember(@PathVariable("memberNo") int memberNo, Model model) {
		Member member = service.selectMember(memberNo); 
		model.addAttribute("member", member);
		return "admin/users_detail";
	}
	
	// 유저 비활성
	@GetMapping("/{memberNo:[0-9]+}/disable")
	@ResponseBody
	public String disableMember(@PathVariable("memberNo") int memberNo) {
		int result = service.disableMember(memberNo);
		
		String disableDate = null;
		if(result > 0) {
			Member member = service.selectMember(memberNo);
			disableDate = service.selectMember(memberNo).getDisableDate();
		}
		
		return disableDate;
	}
	
	// 유저 삭제/복구 변경
	@GetMapping("/{memberNo:[0-9]+}/recover")
	@ResponseBody
	public String recover(@PathVariable("memberNo") int memberNo, String memberCode) {
		
		if(memberCode.equals("N")) {
			service.deleteMember(memberNo);
			return "D";
		} else {
			service.recoverMember(memberNo);
			return "N";
		}
	}
	
	// 탈퇴 유저 복구
}
