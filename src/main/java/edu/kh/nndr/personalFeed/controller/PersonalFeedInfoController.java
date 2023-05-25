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

	@GetMapping("/personalFeedInfo/{no:[0-9]+}")
	public String personalFeedInfo( Model model, @SessionAttribute("loginMember") Member loginMember,@PathVariable("no") int no) {
		MemberInfo infoMember = service.personalMember(no);
		model.addAttribute("infoMember", infoMember); // request scope
		Map<String, Object> friendche = new HashMap<>();
		friendche.put("friendSender", loginMember.getMemberNo());
		friendche.put("friendReciver", no);
		PersonalFriend friendcheck = service.friendChecking(friendche);
		model.addAttribute("friendcheck", friendcheck);
		
		Member personalInfo = service.personalInfo(no);
		model.addAttribute("personalInfo", personalInfo);
		return "personalFeed/personalFeedInfo";
	}

//	@PostMapping("/personalFeedInfo/{no:[0-9]+}")
//	public String boardInsert(MemberInfo member // 커멘드 객체(필드에 파라미터 담겨있음!)
//			, @RequestParam(value = "whatHobby", required = false) String whatHobby,
//			@RequestParam(value = "hobbyInput", required = false) String hobbyInput,
//			@SessionAttribute("loginMember") Member loginMember, @PathVariable("no") int no, RedirectAttributes ra,
//			HttpSession session) throws IllegalStateException, IOException {
//		System.out.println(whatHobby);
//		System.out.println(hobbyInput);
//
//		// 파라미터 : 제목, 내용, 파일(0~5개)
//		// 파일 저장 경로 : HttpSession
//
//		// 세션 : 로그인한 회원의 번호
//		// 리다리렉트 시 데이터 전달 : RedirectAttributes
//		// 작성 성공 시 이동할 게시판 코드 : @PathVariable("boardCode")
//		// List<MultipartFile> images 업로드된 이미지가 없어도 list에 요소 MultipartFile 객체가 추가됨 단,
//		// 업로드된 이미지가 없는 MultipartFile 객체는 파일 (size)가 0또는 파일명(getOriginalFileName())이
//
//		return null;
//	}
	
	@GetMapping(value = "/inputInfo", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String inputhobby(String info, @SessionAttribute("loginMember") Member loginMember) { // 쿼리 스트링에 담겨있는 파라미터
		String[] subInfo = info.split("§");
		System.out.println(subInfo[0]);
		String nl ;
		System.out.println();
		Map<String, Object> infoMap = new HashMap<>();
		if(subInfo.length== 1) {
			System.out.println("널값");
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