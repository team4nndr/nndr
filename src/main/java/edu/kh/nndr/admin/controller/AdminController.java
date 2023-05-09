package edu.kh.nndr.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("")
	public String admin() {
		return "redirect:/admin/user";
	}
}
