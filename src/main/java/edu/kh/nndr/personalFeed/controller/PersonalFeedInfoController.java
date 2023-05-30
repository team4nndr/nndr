package edu.kh.nndr.personalFeed.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.main.service.MainService;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.dto.PersonalFriend;
import edu.kh.nndr.member.model.service.MemberInfoService;
import edu.kh.nndr.member.model.service.MemberService;

@Controller
public class PersonalFeedInfoController {
	
	@Autowired
	private MemberInfoService service;
	@Autowired
	private MemberService memberService;

	// 개인피드 정보 탭에 필요한 세션에 있는 정보 업데이트
	@GetMapping("/personalFeedInfo/{no:[0-9]+}")
	public String personalFeedInfo( Model model, @SessionAttribute("loginMember") Member loginMember,@PathVariable("no") int no) {
		MemberInfo infoMember = service.personalMember(no);
		// 세션에 있는 해당 유저 정보 업데이트 
		model.addAttribute("infoMember", infoMember); // request scope
		Map<String, Object> friendche = new HashMap<>();
		// 친구 추가 관련
		friendche.put("friendSender", loginMember.getMemberNo());
		friendche.put("friendReciver", no);
		PersonalFriend friendcheck = service.friendChecking(friendche);
		model.addAttribute("friendcheck", friendcheck);
		
		Member personalInfo = service.personalInfo(no);
		model.addAttribute("personalInfo", personalInfo);
		return "personalFeed/personalFeedInfo";
	}
	
	// 개인피드 정보 입력
	@GetMapping(value = "/inputInfo", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String inputhobby(String info, @SessionAttribute("loginMember") Member loginMember) { // 쿼리 스트링에 담겨있는 파라미터
		String[] subInfo = info.split("§");
		System.out.println(subInfo[0]);
		String nl ;
		System.out.println();
		Map<String, Object> infoMap = new HashMap<>();
		// 입력받은 정보를 바탕으로 DB 업데이트
		if(subInfo.length== 1) {
			nl="";
			infoMap.put("whatHobby", subInfo[0]);
			infoMap.put("hobby", nl);
			infoMap.put("memberNo", loginMember.getMemberNo());
			int result = service.infoInput(infoMap);
			
		}else {
			infoMap.put("whatHobby", subInfo[0]);
			nl=subInfo[1];
			infoMap.put("hobby", subInfo[1]);
			infoMap.put("memberNo", loginMember.getMemberNo());
			int result = service.infoInput(infoMap);
		}
		// 친구추천을 위한 로그인멤버 정보 업데이트
		switch(subInfo[0]) {
			case "INFO_ELEMENTARY":
				loginMember.setInfoElementary(nl);
				break;
			case "INFO_MIDDLE":
				loginMember.setInfoMiddle(nl);
				break;
			case "INFO_HIGH":
				loginMember.setInfoHigh(nl);
				break;
			case "INFO_COLLEGE":
				loginMember.setInfoCollege(nl);
				break;
		}
		
		

		return null;

	}

}