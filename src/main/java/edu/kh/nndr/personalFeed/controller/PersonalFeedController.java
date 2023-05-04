package edu.kh.nndr.personalFeed.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalFeedController {
	
	@RequestMapping("/personalFeed")
	public String personalFeed() {
		return "personalFeed/personalFeed";
//		return "common/error";
	}
}
