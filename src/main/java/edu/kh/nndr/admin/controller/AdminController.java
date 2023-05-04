package edu.kh.nndr.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("")
	public String admin() {
		return "admin/users";
	}
	
	@GetMapping("/user")
	public String user() {
		return "admin/users_detail";
	}
	
	@GetMapping("/feedback")
	public String feedback() {
		return "admin/feedback";
	}
	
	@GetMapping("/feedback/detail")
	public String feedbackDetail() {
		return "admin/feedback_detail";
	}
}
