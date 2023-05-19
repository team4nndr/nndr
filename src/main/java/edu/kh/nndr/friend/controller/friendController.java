package edu.kh.nndr.friend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.friend.model.sevice.FriendService;
import edu.kh.nndr.member.model.dto.Member;
@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/friend") //기본 주소 +
public class friendController {
   
	@Autowired
	private FriendService service;
	
	//친구 홈 요청 목록 조회
	@RequestMapping("")
   public String friend(@SessionAttribute("loginMember") Member member,Model model) {
		List<Friend> friendList = service.friendRqList(member.getMemberNo());
		model.addAttribute("friendList",friendList);
      return "friend/friend"; 
   }
	
	@RequestMapping("/recom") // + 주소 
   public String friendrecom() {
	   return "friend/friendRecom"; //파일경로
   }
	//친구 요청 목록조회
	@RequestMapping("/request") // + 주소 
	public String friendrequest(@SessionAttribute("loginMember") Member member,Model model) {
	    List<Friend> friendList = service.friendRqList(member.getMemberNo());
	    int friendCount = friendList.size(); 
	    model.addAttribute("friendList",friendList);
	    model.addAttribute("friendCount", friendCount); 
		return "friend/friendRequest"; //파일경로
		
	}
	
	//모든 친구 목록 조회
	@RequestMapping("/all") // + 주소 
	public String friendall(@SessionAttribute("loginMember") Member member,Model model) {
		 List<Friend> friendListAll = service.friendListAll(member.getMemberNo());
		 int friendCount = friendListAll.size();
		 model.addAttribute("friendListAll",friendListAll);
		 model.addAttribute("friendCount", friendCount); 
		return "friend/friendAll"; //파일경로
	}

	//수락 눌렀을 때 
	
	@GetMapping(value="/request/yesbt")
	@ResponseBody
	public int friendUpdate(int friendNo) {
		return service.friendUpdate(friendNo);
	}
	
	
	//거절 눌렀을 때 
	@GetMapping(value="/request/nobt")
	@ResponseBody
	public int friendDelete(int friendNo) {
		return service.friendDelete(friendNo);
	}
	
	//친구 홈수락 눌렀을 때 
	
	@GetMapping(value="/friend/yesbt")
	@ResponseBody
	public int friendUpdate2(int friendNo) {
		return service.friendUpdate(friendNo);
	}
	
	
	//친구 홈거절 눌렀을 때 
	@GetMapping(value="/friend/nobt")
	@ResponseBody
	public int friendDelete2(int friendNo) {
		return service.friendDelete(friendNo);
	}
	
//	친구목록 비동기 처리
	@GetMapping(value = "/request/birequest",  produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Friend> friendRequestRejoin(@SessionAttribute("loginMember") Member member ) {
		return  service.friendRqList(member.getMemberNo());
	}
//	친구홈 친구목록 비동기 처리
	@GetMapping(value = "/friend/birequest",  produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Friend> friendRequestRejoin2(@SessionAttribute("loginMember") Member member ) {
		return  service.friendRqList(member.getMemberNo());
	}
	
//	친구 목록 검색
	@GetMapping(value = "/all/ser",  produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Friend> friendsearch(@RequestParam("query")String query, @SessionAttribute("loginMember") Member member ) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberNo", member.getMemberNo());
		map.put("query", query );
		
		return  service.friendListsearch(map);
	}
	
	
}