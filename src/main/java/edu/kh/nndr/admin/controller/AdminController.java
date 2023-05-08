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

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;

	@GetMapping("")
	public String admin() {
		return "redirect:/admin/user";
	}
	
//	@GetMapping("/user")
//	public String users() {
//		return "admin/users";
//	}
	
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
	public String selectUserList(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			Model model
			) {
		
		// 유저 목록 조회 서비스 호출
		Map<String, Object> map = service.selectMemberList(cp);
		
		// 조회 결과를 request scope에 세팅 후 forward
		model.addAttribute("map", map);
		
		return "admin/users";
	}
}
