package edu.kh.nndr.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/") // 실제로 보는 주소창
	public String mainForward() {
		return "main/main.jsp"; // 폴더 안에 있는 / 내가 보여줄 jsp 경로
	}
	
	
	@GetMapping("/main/forgetPw")
	public String forgetPw() {
		return "main/forgetPw";
	}
	
}