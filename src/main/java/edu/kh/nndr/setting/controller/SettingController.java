package edu.kh.nndr.setting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/setting")
public class SettingController {
	
	@GetMapping("")
	public String setting() {
		return "setting/general";
	}
	
	@GetMapping("/security")
	public String security() {
		return "setting/security";
	}
	
	@GetMapping("/alarm")
	public String alarm() {
		return "setting/alarm";
	}
	
	@GetMapping("/feedback")
	public String feedback() {
		return "setting/feedback";
	}
}
