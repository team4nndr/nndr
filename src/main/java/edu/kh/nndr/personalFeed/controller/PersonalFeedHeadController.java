package edu.kh.nndr.personalFeed.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.dto.PersonalFriend;
import edu.kh.nndr.member.model.service.MemberInfoService;


@SessionAttributes("loginMember")
@Controller
public class PersonalFeedHeadController {
	
	@Autowired
	MemberInfoService service;

	
	
	@GetMapping(value = "/personalAddFriend", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String personalAddFriend(String[] personalAddFriend, @SessionAttribute("loginMember") Member loginMember , RedirectAttributes ra) { // 쿼리 스트링에 담겨있는 파라미터
		Map<String, String> addMap = new HashMap<>();
		addMap.put("friendSender", personalAddFriend[0]);
		addMap.put("friendReciver", personalAddFriend[1]);
		
		Map<String, Object> friendche = new HashMap<>();
		friendche.put("friendSender", personalAddFriend[0]);
		friendche.put("friendReciver", personalAddFriend[1]);
		PersonalFriend friendcheck = service.friendChecking(friendche);
		System.out.println("추가");
		if(friendcheck != null) {
			String message = "이미 친구 상태이거나 신청 중인 회원입니다.";
			ra.addFlashAttribute("message",message);
			return "redirect:";
		}
		int result = service.personalAdd(addMap);
		return "";
	}
	@GetMapping(value = "/personalDelFriend", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String personalDelFriend(String[] personalDelFriend, @SessionAttribute("loginMember") Member loginMember ) { // 쿼리 스트링에 담겨있는 파라미터
		Map<String, String> delMap = new HashMap<>();
		delMap.put("friendSender", personalDelFriend[0]);
		delMap.put("friendReciver", personalDelFriend[1]);
		int result = service.personalDel(delMap);
		return "";
	}
	@GetMapping(value = "/personalAcceptFriend", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String personalAcceptFriend(String[] personalAcceptFriend, @SessionAttribute("loginMember") Member loginMember ) { // 쿼리 스트링에 담겨있는 파라미터
		Map<String, String> AcceptMap = new HashMap<>();
		AcceptMap.put("friendSender", personalAcceptFriend[0]);
		AcceptMap.put("friendReciver", personalAcceptFriend[1]);
		System.out.println(personalAcceptFriend[0]);
		System.out.println(personalAcceptFriend[1]);
		int result = service.personalAccept(AcceptMap);
		return "";
	}
	
	@GetMapping(value = "/personalCanFriend", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String personalCanFriend(String[] personalCanFriend, @SessionAttribute("loginMember") Member loginMember ) { // 쿼리 스트링에 담겨있는 파라미터
		Map<String, String> delMap = new HashMap<>();
		delMap.put("friendSender", personalCanFriend[0]);
		delMap.put("friendReciver", personalCanFriend[1]);
		int result = service.personalCan(delMap);
		return "";
	}

	@GetMapping(value = "/cvCho", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String cvCho(@RequestParam Map<String, Object> cvCho) { // 쿼리 스트링에 담겨있는 파라미터
		int result = service.backImg(cvCho);
		return "";
	}
	
	@GetMapping(value = "/delback", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String delback(@RequestParam int memberNo) { // 쿼리 스트링에 담겨있는 파라미터
		int result = service.delBackImg(memberNo);
		return "";
	}
	
	@GetMapping(value = "/pcvCho", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String pcvCho( Model model, @RequestParam Map<String, Object> pcvCho, @SessionAttribute("loginMember") Member loginMember) { // 쿼리 스트링에 담겨있는 파라미터
		String path =(String)pcvCho.get("imgPath");
		String img = (String)pcvCho.get("imgRename");
		loginMember.setProfileImage(path+img);
		model.addAttribute("loginMember", loginMember);
		int result = service.proImg(pcvCho);
		
		
		return "";
	}
	
}