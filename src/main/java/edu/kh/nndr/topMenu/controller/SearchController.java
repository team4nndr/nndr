package edu.kh.nndr.topMenu.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.topMenu.service.SearchService;

@RequestMapping("/mainFeed")
@Controller
@SessionAttributes({"loginMember"})
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	@GetMapping("/")
	public String searchHashTag(
			Model model) {
		
		List<String> tagList = service.selectHashTagList();
		
		model.addAttribute("tagList", tagList);
		
		return "topMenu/header";
	}
	

}
