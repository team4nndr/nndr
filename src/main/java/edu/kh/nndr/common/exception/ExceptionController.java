package edu.kh.nndr.common.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice // 예외 처리용 컨트롤러 (프로젝트 전역)
public class ExceptionController {
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		e.printStackTrace();
		model.addAttribute("e", e);
		
		return "common/error";
	}	
}
