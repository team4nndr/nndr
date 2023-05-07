package edu.kh.nndr.mainFeed.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainFeedController {

	@RequestMapping("/mainFeed")
	public String mainFeed() {
		
		return "mainFeed/mainFeed";
		
	}
}
