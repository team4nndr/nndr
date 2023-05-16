package edu.kh.nndr.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
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
	
	// 유저 비활성
	@ResponseBody
	@GetMapping("/{memberNo:[0-9]+}/disable")
	public String disableMember(@PathVariable("memberNo") int memberNo) {
		service.disableMember(memberNo);
		return service.selectMember(memberNo).getDisableDate();
	}
	
	// 유저 삭제
	@ResponseBody
	@GetMapping("/{memberNo:[0-9]+}/delete")
	public String deleteMember(@PathVariable("memberNo") int memberNo) {
		service.deleteMember(memberNo);
		String tmp = service.selectMember(memberNo).getDeleteDate();
		return service.selectMember(memberNo).getDeleteDate();
	}
	
	// 계정 정상화(삭제유저 복구, 비활성 해제)
	@ResponseBody
	@GetMapping("/{memberNo:[0-9]+}/enable")
	public int enableMember(@PathVariable("memberNo") int memberNo) {
		return service.enableMember(memberNo);
	}
	
	
	// 유저 상세 조회
	@GetMapping("/{memberNo:[0-9]+}")	
	public String selectMember(@PathVariable("memberNo") int memberNo, Model model) {
		Member member = service.selectMember(memberNo); 
		model.addAttribute("member", member);
		return "admin/users_detail";
	}
}
