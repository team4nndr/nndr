package edu.kh.nndr.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.nndr.admin.model.service.AdminService;
import edu.kh.nndr.member.model.dto.Member;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;

	@GetMapping("")
	public String admin() {
		return "redirect:/admin/user";
	}
	
//	@GetMapping("/user/")
//	public String user() {
//		return "admin/users_detail";
//	}
	
	@GetMapping("/feedback")
	public String feedback() {
		return "admin/feedback";
	}
	
	@GetMapping("/feedback/detail")
	public String feedbackDetail() {
		return "admin/feedback_detail";
	}
	
	// 유저 목록 조회
	@GetMapping("/user")
	public String selectMemberList(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			Model model) {
		Map<String, Object> map = service.selectMemberList(cp);
		model.addAttribute("map", map);
		return "admin/users";
	}
	
	// 유저 상세 조회
	@GetMapping("/user/{memberNo}")	
	public String selectMember(@PathVariable("memberNo") int memberNo, Model model) {
		Member member = service.selectMember(memberNo); 
		model.addAttribute("member", member);
		return "admin/users_detail";
	}
	
	// 비활성 유저 비활성 해제
	
	// 탈퇴 유저 복구
}
