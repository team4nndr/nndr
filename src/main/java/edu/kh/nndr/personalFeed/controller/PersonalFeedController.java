package edu.kh.nndr.personalFeed.controller;

import java.net.http.HttpClient.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.service.MemberInfoService;
import edu.kh.nndr.member.model.service.MemberService;


@SessionAttributes("loginMember")
@Controller
public class PersonalFeedController {
	
	@Autowired
	MemberInfoService service;

	@GetMapping("/personalFeed/{no:[0-9]+}")
	public String personalFeed( Model model, @PathVariable("no") int no) {
		MemberInfo infoMember = service.personalMember(no);
		model.addAttribute("infoMember", infoMember); // request scope
		// 취미 목록 조회 서비스 호출
		Map<String, Object> HobbyMap = service.selectHobbyList(no); 
				
		// 조회 결과를 request scope에 세팅 후 forward
		model.addAttribute("HobbyMap", HobbyMap);
		return "personalFeed/personalFeed";
	}
	
	@GetMapping("/personalFeed/infoIntro")
	public String infoIntro(MemberInfo member, @SessionAttribute("loginMember") Member loginMember, @RequestHeader(value = "referer") String referer, RedirectAttributes ra) {
		member.setMemberNo(loginMember.getMemberNo());
		System.out.println(member.getMemberNo());
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
		
		List<MemberHobby> insertHobby = new ArrayList<MemberHobby>();
//		Map<String, Object> inputHobbyMap = new HashMap<>();
//		Map<String, Object> deleteHobbyMap = new HashMap<>();
		
		
		for(MemberHobby i : myHobby) {
			for(String j : hobbyArray){
				if(j.equals(i.getHobby())) {
					break;
				}else {
					
				}
				
			}
			
		}
		int memberNo = loginMember.getMemberNo();
		// return 리다이렉트 / 포워드; -> 새로운 화면이 보임(동기식)
//			return 데이터; -> 데이터를 요청한 곳으로 반환(비동기식)
//		int result = service.inputhobby(hobbyInput, memberNo);
		return null;

	}
}