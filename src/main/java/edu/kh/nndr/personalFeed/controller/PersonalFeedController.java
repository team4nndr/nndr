package edu.kh.nndr.personalFeed.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.alarm.model.dto.Alarm;
import edu.kh.nndr.alarm.model.service.AlarmService;
import edu.kh.nndr.friend.model.sevice.FriendService;
import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.dto.Reply;
import edu.kh.nndr.mainFeed.model.service.MainFeedService;
import edu.kh.nndr.mainFeed.model.service.ReplyService;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.dto.PersonalFriend;
import edu.kh.nndr.member.model.service.MemberInfoService;


@Controller
public class PersonalFeedController {
	
	@Autowired
	MemberInfoService service;
	@Autowired
	MainFeedService mainService;
	@Autowired
	FriendService friendService;

	@Autowired
	private ReplyService replyService;
	
	@Autowired
    private AlarmService alarmService;


	@GetMapping("/personalFeed/{no:[0-9]+}")
	public String personalFeed(@RequestHeader(value="referer", required=false) String referer, Model model, @SessionAttribute("loginMember") Member loginMember, @PathVariable("no") int no, RedirectAttributes ra) {
		MemberInfo infoMember = service.personalMember(no);
		if(infoMember == null) {
			String message = "없는 회원이거나 접근이 제한된 회원입니다.";
			ra.addFlashAttribute("message",message);
			String path ="redirect:";
			path += referer;
			return path;
		}
		
		model.addAttribute("infoMember", infoMember); // request scope

		System.out.println(infoMember);
		Map<String, Object> HobbyMap = service.selectHobbyList(no); 
		model.addAttribute("HobbyMap", HobbyMap);
		
		List<MemberInfo> imgSet = service.imgSet(no);
		model.addAttribute("imgSet", imgSet);
		
		Map<String, Object> friendche = new HashMap<>();
		friendche.put("friendSender", loginMember.getMemberNo());
		friendche.put("friendReciver", no);
		PersonalFriend friendcheck = service.friendChecking(friendche);
		model.addAttribute("friendcheck", friendcheck);
		
		Member personalInfo = service.personalInfo(no);
		model.addAttribute("personalInfo", personalInfo);
		

		//personalBoardList
		List<Board> boardList = mainService.personalFeedList(no);
		
		// 조회한 게시글에 달린 댓글 조회
		for(Board board : boardList) {
			List<Reply> personalReply = replyService.replyList(board.getBoardNo());
			board.setReplyList(personalReply);
		}	
		model.addAttribute("boardList", boardList);
		
		////////////////////////////      
		
		List<Member> friendList = friendService.friendListMember(no);
		int friendCount = friendList.size();
		model.addAttribute("friendList", friendList);
		model.addAttribute("friendCount", friendCount);
		
		//친구 추천 목록
		Map<String, Object> params = new HashMap<>();
	    params.put("memberNo", loginMember.getMemberNo());
	    params.put("infoHigh", loginMember.getInfoHigh());
	    params.put("infoCollege", loginMember.getInfoCollege());
	    params.put("infoMiddle", loginMember.getInfoMiddle());
	    params.put("infoElementary", loginMember.getInfoElementary());

	    List<Member> friendSuggestion = friendService.friendSuggestion(params);
	    model.addAttribute("friendSuggestion", friendSuggestion);

		
		
		
		
		
		
		
		
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
	
	@PostMapping("/personalFeed/perInsertContent")
	public String perInsertContent(Board board, @RequestHeader(value = "referer") String referer
			, @SessionAttribute("loginMember") Member loginMember
			, @RequestParam(value="images",required=false) List<MultipartFile> images
			, RedirectAttributes ra
			,HttpSession session)throws IllegalStateException, IOException {
			String[] subInfo = referer.split("/");
		
			int oth = Integer.parseInt(subInfo[4]); 
			
			// 로그인한 회원 번호를 얻어와 board에 세팅
			board.setMemberNo(loginMember.getMemberNo());
			board.setOthermemNo(Integer.parseInt(subInfo[4]));
			String path = "redirect:";
			path += referer;
			// 업로드된 이미지 서버에 실제로 저장되는 경로
			// +웹에서 요청시 이미지를 볼 수 있는 경로
			String webPath = "/resources/images/mainFeed/";
			String filePath = session.getServletContext().getRealPath(webPath);
			
			// 게시글 삽입 서비스 호출 후 삽입된 게시글 번호 반환 
			
			int boardNo = mainService.feedInsert(board,images,webPath,filePath);
		
			String message = null;
//			ra.addFlashAttribute("message",message);
//			Alarm alarm = null;
//			alarm.setAlarmContent("내 피드에 게시글이 작성되었습니다.");
//			alarm.setAlarmContent("내 피드에 게시글이 작성되었습니다.");
//			alarm.setAlarmContent("내 피드에 게시글이 작성되었습니다.");
//			alarmService.insert(alarm);
		
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