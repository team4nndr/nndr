package edu.kh.nndr.topMenu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import edu.kh.nndr.alram.model.dto.Alram;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.topMenu.service.TopMenuService;

@SessionAttributes({"loginMember"})
@Controller
public class TopMenuController {
	
	@Autowired
	private TopMenuService service;

	// 로그아웃(세션 만료)
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete(); 
		return "redirect:/";
	}
	
	
	// 알람 목록 조회
	@GetMapping("/personalFeed/{memberNo}")
	public List<Alram> alramList (@SessionAttribute("loginMember") Member member ,@PathVariable("memberNo") int memberNo) {
		return service.alramList(member.getMemberNo());
	}
}












