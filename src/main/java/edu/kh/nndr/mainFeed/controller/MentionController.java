package edu.kh.nndr.mainFeed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.mainFeed.model.service.MentionService;
import edu.kh.nndr.member.model.dto.Member;

@Controller
@SessionAttributes({"loginMember"})
public class MentionController {
	
	@Autowired
	private MentionService service;
	
	@GetMapping("/mention")
	@ResponseBody
	public List<Member> mention(@RequestParam String keyword,
			@SessionAttribute("loginMember") Member loginMember) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("query", keyword);
		paramMap.put("memberNo", loginMember.getMemberNo());
		
		return service.mention(paramMap);
	}
}
