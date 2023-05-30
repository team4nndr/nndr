package edu.kh.nndr.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.main.service.MainService;
import edu.kh.nndr.member.model.dto.Member;

@SessionAttributes({"loginMember"})
@Controller
public class MainController {

	
	@Autowired
	private MainService service;
	
	
	@RequestMapping("/") // 실제로 보는 주소창
	public String mainForward() {
		return "main/main"; // jsp 폴더 안에 있는 jsp 파일 경로
	}
	
	
	// 검색시, 일치하는 게시글 목록 출력 임시 화면 (삭제 예정)
	@RequestMapping("/matching") // 실제로 보는 주소창
	public String tempForward() {
		return "topMenu/matchingList"; // jsp 폴더 안에 있는 jsp 파일 경로
	}
	
	
	@GetMapping("/main/forgetPw")
	public String forgetPw() {
		return "main/forgetPw";
	}
	
	
	@GetMapping("/main/forgetPw/newPw")
	public String newPw() {
		return "main/newPw";
	}
	
	// 새 계정 만들기 이메일 유효성 검사
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
	
	// 비밀번호를 잊으셨습니까 => 이메일 유효성 확인
	@GetMapping("/main/emailDuplication")
	@ResponseBody
	public int emailDup (@RequestParam ("emailDup") String emailDup) {
		
		
		return service.emailDup(emailDup);
	}
	
	// 비밀번호 변경
	@PostMapping("/main/forgetPw/changePw")
	public String changePw(@RequestParam("newPw") String newPw 
						,@SessionAttribute(value="loginMember",required = false) Member loginMember
						,RedirectAttributes ra, HttpSession session
			) {
		
		int result = 0;
		
		if(loginMember !=null) {
			int memberNo = loginMember.getMemberNo();
			
			result = service.changePw(newPw,memberNo); // 로그인 했을 때 비번 변경
		}else {
			String findEmail = (String)session.getAttribute("findEmail");
			
			result = service.changePw(newPw,findEmail); // 이메일 모를 때 비번 변경
			
		}
		
		
		String path = "redirect:";
		String message = null;
		
		if(result>0) {
			message = "비밀번호가 변경되었습니다.";
			path += "/";
		}else {
			message = "현재 비밀번호가 일치하지 않습니다.";
			path += "newPw";
		}
		
		ra.addFlashAttribute("message",message);
		
		return path;
	}
	
	
	 
	
}