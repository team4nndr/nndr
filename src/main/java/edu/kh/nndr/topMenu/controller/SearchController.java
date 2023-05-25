package edu.kh.nndr.topMenu.controller;

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

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.topMenu.model.service.SearchService;


@Controller
@SessionAttributes({"loginMember"})
public class SearchController {
	
	@Autowired
	private SearchService service;
	// 일치하는 해시태그 목록 조회(검색)
	@GetMapping(value="/mainFeed/getTags", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Hashtag> getTags(@RequestParam("query") String query){
		System.out.println("query : " + query);
		return service.getTags(query);
	}
	
	// 일치하는 친구 이름 목록 조회(검색)
    @GetMapping(value="/mainFeed/friendNameList", produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<Member> friendNameList(@RequestParam("fName") String fName, @SessionAttribute("loginMember") Member loginMember){

    	Map<String, Object> map = new HashMap<>();
    	map.put("memberNo", loginMember.getMemberNo());
    	map.put("query", fName);
    	
    	System.out.println(map);
    	
    	return service.friendNameList(map);
    }
    
    
    
    // 해시태그 관련 키워드가 포함된 게시글 조회
    // @GetMapping("/personalFeed/${fName}")
    // public String 

}




