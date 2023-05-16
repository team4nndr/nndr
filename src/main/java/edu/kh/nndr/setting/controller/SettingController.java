package edu.kh.nndr.setting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.setting.model.service.SettingService;

@Controller
@RequestMapping("/setting")
public class SettingController {

	@Autowired
	private SettingService service;
	
	
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
	
	@PostMapping("/feedback")
	@ResponseBody
	public int feedback(@RequestBody Feedback feedback) {
		return service.feedback(feedback);
	}
}
