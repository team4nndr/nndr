package edu.kh.nndr.personalFeed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.kh.nndr.friend.model.sevice.FriendService;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.dto.PersonalFriend;
import edu.kh.nndr.member.model.service.MemberInfoService;
import edu.kh.nndr.member.model.service.MemberService;

@Controller
public class PersonalFeedFriendController {
	
	@Autowired
	MemberInfoService service;
	@Autowired
	FriendService friendService;

	@GetMapping("/personalFeedFriend/{no}")
	public String personalFeedFriend( Model model,@SessionAttribute("loginMember") Member loginMember, @PathVariable("no") int no) {
		MemberInfo infoMember = service.personalMember(no);
		model.addAttribute("infoMember", infoMember); // request scope
		Map<String, Object> friendche = new HashMap<>();
		friendche.put("friendSender", loginMember.getMemberNo());
		friendche.put("friendReciver", no);
		PersonalFriend friendcheck = service.friendChecking(friendche);
		model.addAttribute("friendcheck", friendcheck);
		
		Member personalInfo = service.personalInfo(no);
		model.addAttribute("personalInfo", personalInfo);
		
		List<Member> friendList = friendService.friendListMember(no);
		int friendCount = friendList.size();
		model.addAttribute("friendList", friendList);
		model.addAttribute("friendCount", friendCount);
		System.out.println(friendList);
		
		//친구 추천 목록
		Map<String, Object> params = new HashMap<>();
		params.put("memberNo", loginMember.getMemberNo());
		params.put("infoHigh", loginMember.getInfoHigh());
		params.put("infoCollege", loginMember.getInfoCollege());
		params.put("infoMiddle", loginMember.getInfoMiddle());
		params.put("infoElementary", loginMember.getInfoElementary());

		List<Member> friendSuggestion = friendService.friendSuggestion(params);
		model.addAttribute("friendSuggestion", friendSuggestion);
		
		return "personalFeed/personalFeedFriend";
	}
}