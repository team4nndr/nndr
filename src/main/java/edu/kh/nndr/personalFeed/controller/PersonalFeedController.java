package edu.kh.nndr.personalFeed.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.service.MemberInfoService;


@SessionAttributes("loginMember")
@Controller
public class PersonalFeedController {
	
	@Autowired
	MemberInfoService service;

	@GetMapping("/personalFeed/{no:[0-9]+}")
	public String personalFeed( Model model, @PathVariable("no") int no) {
		MemberInfo infoMember = service.personalMember(no);
		model.addAttribute("infoMember", infoMember); // request scope

		Map<String, Object> HobbyMap = service.selectHobbyList(no); 
		model.addAttribute("HobbyMap", HobbyMap);
		
		List<Map<String, String>> imgSet = service.imgSet(no);
		model.addAttribute("imgSet", imgSet);
		
		return "personalFeed/personalFeed";
	}
	
	@GetMapping("/personalFeed/infoIntro")
	public String infoIntro(MemberInfo member, @SessionAttribute("loginMember") Member loginMember, @RequestHeader(value = "referer") String referer, RedirectAttributes ra) {
		member.setMemberNo(loginMember.getMemberNo());
		int result = service.infoIntro(member);
		String path = "redirect:";
		if(result > 0) {// 성공
		} else { // 실패
		}
		path += referer;
		return path;
	}
	
	@GetMapping(value = "/inputhobby", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String inputhobby(String[] hobbyArray, @SessionAttribute("loginMember") Member loginMember) { // 쿼리 스트링에 담겨있는 파라미터
		List<MemberHobby> myHobby = new ArrayList<MemberHobby>();
		myHobby = service.myHobby(loginMember.getMemberNo());
		Set<String> insertSet = new HashSet<String>(Arrays.asList(hobbyArray));
		List<MemberHobby> insertHobby = new ArrayList<MemberHobby>();
		List<MemberHobby> deleteHobby = new ArrayList<MemberHobby>();
		

		for(MemberHobby i : myHobby) {
			if(insertSet.contains(i.getHobby())) {
				insertSet.remove(i.getHobby());
			}else {
				MemberHobby de = new MemberHobby(0, loginMember.getMemberNo(), i.getHobby());
				deleteHobby.add(de);
			}
		}
		for(String i : insertSet) {
			MemberHobby ad = new MemberHobby(0, loginMember.getMemberNo(), i);
			insertHobby.add(ad);
		}
		
		int updateHobby = service.updateHobby(insertHobby, deleteHobby);
		
		return null;

	}
}