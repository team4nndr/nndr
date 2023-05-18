package edu.kh.nndr.topMenu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@SessionAttributes({"loginMember"})
@Controller
public class TopMenuController {

	// 로그아웃(세션 만료)
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete(); 
		return "redirect:/";
	}
}