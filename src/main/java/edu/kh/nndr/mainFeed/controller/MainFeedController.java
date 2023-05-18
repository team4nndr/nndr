package edu.kh.nndr.mainFeed.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.service.MainFeedService;
import edu.kh.nndr.member.model.dto.Member;

import edu.kh.nndr.member.model.dto.Member;
@SessionAttributes("{loginMember}")
@Controller
public class MainFeedController {
	
	@Autowired
	private MainFeedService service;

	/** 게시글확인
	 * @param loginMember
	 * @param boardNo
	 * @return
	 */
	@GetMapping("/mainFeed")
	public String feedList(Model model) {
		
		List<Board> boardList = service.feedList();
		
		model.addAttribute("boardList",boardList);
		
		return "mainFeed/mainFeed";
		
	}
	
	
	@PostMapping("/mainFeed")
	public String feedInsert(Board board
			, @SessionAttribute("loginMember") Member loginMember
			, @RequestParam(value="images",required=false) List<MultipartFile> images
			, RedirectAttributes ra
			,HttpSession session)throws IllegalStateException, IOException {
		
			// 로그인한 회원 번호를 얻어와 board에 세팅
			board.setMemberNo(loginMember.getMemberNo());
			
			// 업로드된 이미지 서버에 실제로 저장되는 경로
			// +웹에서 요청시 이미지를 볼 수 있는 경로
			String webPath = "/resources/images/mainFeed/";
			String filePath = session.getServletContext().getRealPath(webPath);
			
			// 게시글 삽입 서비스 호출 후 삽입된 게시글 번호 반환 
			int boardNo = service.feedInsert(board,images,webPath,filePath);
		
			String message = null;
			
			if(boardNo > 0) {// 성공시
				message = "게시글이 등록 되었습니다";
				
			}else {// 실패시
				message = "게시글 등록 실패.......";
			}
			
			ra.addFlashAttribute("message",message);
		
		
		return "redirect:/mainFeed";
	}
	
	
}
