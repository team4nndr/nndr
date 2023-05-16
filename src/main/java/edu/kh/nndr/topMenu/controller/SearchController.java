package edu.kh.nndr.topMenu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.topMenu.service.SearchService;


@Controller
@SessionAttributes({"loginMember"})
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	@GetMapping(value="/mainFeed/getTags", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Hashtag> getTags(@RequestParam("query") String query){
		System.out.println("query : " + query);
		return service.getTags(query);
	}
	

}
