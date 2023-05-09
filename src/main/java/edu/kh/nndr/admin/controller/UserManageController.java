package edu.kh.nndr.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.nndr.admin.model.service.UserManageService;
import edu.kh.nndr.member.model.dto.Member;

@Controller
@RequestMapping("/admin/user")
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
	@GetMapping("/{memberNo}")	
	public String selectMember(@PathVariable("memberNo") int memberNo, Model model) {
		Member member = service.selectMember(memberNo); 
		model.addAttribute("member", member);
		return "admin/users_detail";
	}
	
	// 비활성 유저 비활성 해제
	
	// 탈퇴 유저 복구
}
