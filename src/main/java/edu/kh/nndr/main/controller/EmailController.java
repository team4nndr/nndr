package edu.kh.nndr.main.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.main.service.EmailService;

@Controller
@RequestMapping("/sendEmail")
@SessionAttributes("authKey") // session에 올리고 가져오는 역할
public class EmailController {
    
    @Autowired // 등록된 bean 중에서 자료형이 같은 객체를 자동으로 의존성 주입(대입) [참조 변수 wire 줄로 연결 serviceimpl의 객체를 쓰기 위해 사용] 
    private EmailService service; 
    
    @GetMapping("/signUp")
    @ResponseBody
    public int signUp(String email) {
        
        return service.signUp(email, "회원 가입");
        
    }
    
    
    @GetMapping("/checkAuthKey")
    @ResponseBody
    public int checkAuthKey(@RequestParam Map<String, Object> paramMap){

    	System.out.println(paramMap); // {inputKey=wc3rxG, email=knbdh@nate.com} 인증번호 담겨서
        
        return service.checkAuthKey(paramMap);
    }
    
}

