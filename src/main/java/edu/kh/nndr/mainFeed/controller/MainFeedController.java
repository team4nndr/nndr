package edu.kh.nndr.mainFeed.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.service.MainFeedService;
import edu.kh.nndr.member.model.dto.Member;

import edu.kh.nndr.member.model.dto.Member;

@Controller
@SessionAttributes("{loginMember}")
public class MainFeedController {
	
	@Autowired
	private MainFeedService service;

	/** 게시글확인
	 * @param loginMember
	 * @param boardNo
	 * @return
	 */
	@GetMapping("/mainFeed")
	public String feedList(Model model) {
		
		List<Board> boardList = service.feedList();
		
		model.addAttribute("boardList",boardList);
		
		return "mainFeed/mainFeed";
		
	}
	
	
	
}
