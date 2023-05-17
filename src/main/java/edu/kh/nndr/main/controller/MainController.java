package edu.kh.nndr.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.nndr.main.service.MainService;

@Controller
public class MainController {

	
	@Autowired
	private MainService service;
	
	
	@RequestMapping("/") // 실제로 보는 주소창
	public String mainForward() {
		return "main/main"; // jsp 폴더 안에 있는 jsp 파일 경로
	}
	
	
	@GetMapping("/main/forgetPw")
	public String forgetPw() {
		return "main/forgetPw";
	}
	
	
	@GetMapping("/main/forgetPw/newPw")
	public String newPw() {
		return "main/newPw";
	}
	
	// 새 계정 만들기 이메일 중복 검사
	@GetMapping("/main/email")
	@ResponseBody
	public int email(@RequestParam("inputEmail") String inputEmail ){
		return service.email(inputEmail); // 매개변수가 같게
	}
	
	
	// 비밀번호를 잊으셨습니까 => 이메일 중복 체크
	@GetMapping("/main/emailCheck") 
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email ) {
		
		return service.emailCheck(email);
	}
	
	
	 
	
}