package edu.kh.nndr.topMenu.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.topMenu.service.SearchService;



@RequestMapping("/mainFeed")
@RestController
@SessionAttributes({"loginMember"})
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	@GetMapping(value="/getTags", produces = "application/json; charset=UTF-8")
    public List<Hashtag> getTags(@RequestParam("hashtagKeyword") String hashtagKeyword) {
        return service.getTags(hashtagKeyword);
    }
}
	


