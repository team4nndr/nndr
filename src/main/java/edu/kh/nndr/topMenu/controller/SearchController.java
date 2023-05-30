package edu.kh.nndr.topMenu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import edu.kh.nndr.alarm.model.dto.Alarm;
import edu.kh.nndr.alarm.model.service.AlarmService;
import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.topMenu.model.service.SearchService;
import edu.kh.nndr.topMenu.model.service.TopMenuService;


/**
 * @author 이예슬
 *
 */
@Controller
@SessionAttributes({"loginMember", "alarmList"})
public class SearchController {
	
	@Autowired
	private SearchService service; //검색 서비스 호출
	@Autowired
	private AlarmService alarmService; //알람 서비스 호출
	@Autowired
	private TopMenuService TopMenuService; //상단바 서비스 호출
	
	// 검색어 입력 시, 검색어와 일치하는 목록 조회(게시글 목록)
	@GetMapping(value="/mainFeed/boardList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Board> matchingList(@RequestParam("query") String query  ){
		System.out.println("query : " + query);
		
		return service.matchingList(query);
	}
	
	// 검색어 입력 시, 게시글 목록을 보여주는 페이지 호출
	@GetMapping(value="/matchingList/{query}", produces="application/json; charset=UTF-8")
	public String boardList(@PathVariable("query") String query, Model model ) {
		System.out.println(query);
		
		List<Board> boardList = service.matchingList(query);
		
		model.addAttribute("boardList",boardList);
		
		return "topMenu/matchingList";
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
    
    // 알람 삭제
    @GetMapping(value = "/alarmDel", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String alarmDel(String alarmDel, Model model, @SessionAttribute("loginMember") Member loginMember) {
    	System.out.println(alarmDel);
    	int result = alarmService.alarmDel(alarmDel);
    	List<Alarm> alarmList = TopMenuService.alarmList(loginMember.getMemberNo());
		model.addAttribute("alarmList",alarmList); // 현재 알람 목록
    	
    	return "";
    }
    
    // 알람 모두 삭제
    @GetMapping(value = "/delAllAlarm", produces = "application/text; charset=UTF-8")
    @ResponseBody
    public String delAllAlarm(Model model, @SessionAttribute("loginMember") Member loginMember) {
    	int result = alarmService.alarmAllDel(loginMember.getMemberNo());
    	List<Alarm> alarmList = TopMenuService.alarmList(loginMember.getMemberNo());
    	model.addAttribute("alarmList",alarmList); // 현재 알람 목록
    	
    	return "";
    }
    
    

}




