package edu.kh.nndr.topMenu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@SessionAttributes({"loginMember"})
@Controller
public class topMenuController {

	@RequestMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {
		
		// SessionStatus : 세션 상태를 관리하는 객체
		
		// 세션 무효화
		// Servlet -> HttpSession.invalidate()
		
		// Spring
		// 1) HttpSession을 이용한 경우
		//    -> HttpSession.invalidate()
		
		// 2) Model + @SessionAttributes 이용한 경우
		//    -> SessionStatus.setComplete()
		
		 status.setComplete(); 
//		 session.invalidate(); // 세션 무효화
		
		return "redirect:/";
	}
	
	

}
