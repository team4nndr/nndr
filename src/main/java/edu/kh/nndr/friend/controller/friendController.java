package edu.kh.nndr.friend.controller;

import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	@RequestMapping("")
   public String friend() {
      return "friend/friend"; 
   }
	
	@RequestMapping("/recom") // + 주소 
   public String friendrecom() {
	   return "friend/friendRecom"; //파일경로
   }
	@RequestMapping("/request") // + 주소 
	public String friendrequest(@SessionAttribute("loginMember") Member member,Model model) {
	    List<Friend> friendList = service.friendRqList(member.getMemberNo());
	    int friendCount = friendList.size(); 
	    model.addAttribute("friendList",friendList);
	    model.addAttribute("friendCount", friendCount); 
		return "friend/friendRequest"; //파일경로
		
	}
	
	
	@RequestMapping("/all") // + 주소 
	public String friendall() {
		return "friend/friendAll"; //파일경로
	}

	//수락 눌렀을 때 
	
	@GetMapping(value="/request/yesbt")
	@ResponseBody
	public int friendUpdate(int friendNo) {
		return service.friendUpdate(friendNo);
	}
	
	@GetMapping(value = "/request/birequest",  produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Friend> friendRequestRejoin(@SessionAttribute("loginMember") Member member ) {
		return  service.friendRqList(member.getMemberNo());
	}
	
}