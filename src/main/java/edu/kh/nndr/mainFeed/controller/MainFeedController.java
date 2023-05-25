package edu.kh.nndr.mainFeed.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.dto.Reply;
import edu.kh.nndr.mainFeed.model.service.MainFeedService;
import edu.kh.nndr.mainFeed.model.service.ReplyService;
import edu.kh.nndr.member.model.dto.Member;

import edu.kh.nndr.member.model.dto.Member;

@Controller
@SessionAttributes("{loginMember}")
public class MainFeedController {
	
	@Autowired
	private MainFeedService service;
	@Autowired
	private ReplyService replyService;

	/** 게시글확인
	 * @param loginMember
	 * @param boardNo
	 * @return
	 */
	@GetMapping("/mainFeed")
	public String feedList(Model model,@SessionAttribute("loginMember") Member loginMember
			, Board brd) {
		
		List<Board> boardList = service.feedList(loginMember.getMemberNo());
		

		
		Map<String,Object> map = new HashMap<String, Object>();
		
			map.put("boardNo",brd.getBoardNo());
			map.put("memberNo", loginMember.getMemberNo());
		
			int result = service.feedLikeCheck(map);
			
			if(result > 0 ) {
				model.addAttribute("likeCheck","on");
			}
			
		
		// 조회한 게시글에 달린 댓글 조회
		for(Board board : boardList) {
			List<Reply> list = replyService.replyList(board.getBoardNo());
			board.setReplyList(list);
			
			
		}
		
	
		
		model.addAttribute("boardList", boardList);
		
		return "mainFeed/mainFeed";	
	}

	/** 게시글작성
	 * @param board
	 * @param loginMember
	 * @param images
	 * @param ra
	 * @param session
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
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
	
	
	// 게시글 삭제
	// + 해당 게시글에 달린 댓글 모두 삭제
	@GetMapping("/mainFeed/delete")
	public String feedDelete(Board board
			, @SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra
			,HttpSession session){
		
		board.setMemberNo(loginMember.getMemberNo());
		
	
		int result = service.feedDelete(board);
		String msg = null;				

		if(result > 0) {		
			int replyResult = replyService.deleteReplyAll(board.getBoardNo());
	
			if(replyResult > 0) {
				msg = "게시글이 삭제되었습니다";
			} else {
				msg = "댓글 삭제 실패";
			}
		} else {
			msg = "게시글 삭제 실패....";
		}
		ra.addFlashAttribute("message", msg);
		
		return "redirect:/mainFeed";
	}
	
	// 게시글 수정
	@PostMapping("/mainFeed/update")
	public String feedUpdate(Board board
			, @SessionAttribute("loginMember") Member loginMember	
		, @RequestParam(value="deleteList",required=false) String deleteList
		, @RequestParam(value="images",required=false) List<MultipartFile> images
		, HttpSession session
		, RedirectAttributes ra) throws IllegalStateException, IOException {
		
		
		board.setMemberNo(loginMember.getMemberNo());

		
		
		String webPath = "/resources/images/mainFeed/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int result = service.feedUpdate(board,images,webPath,filePath,deleteList);
		
		String message = null;
		
		if(result>0) {
			
			message = "게시글이 수정되었습니다";
		}else {
			message = "게시글 수정 실패..............";
		}
		ra.addFlashAttribute("message", message);
    
		return "redirect:/mainFeed";	
	}
	
	/** 수정시 게시번호에 맞는 게시글 하나 불러오기
	 * @param boardNo
	 * @return
	 */
	@GetMapping(value="/mainFeed/selectOne", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Board selectOne(int boardNo) {
		return service.selectOne(boardNo);
	}
	
	
//	@GetMapping("/mainFeed/like")
//	public Board feedLike(int boardNo,Model model
//			,@SessionAttribute(value="loginMember",required=false) Member loginMember
//			) {
//		
//		Board board = service.selectOne(boardNo);
//		if(board !=null) {
//			if(loginMember !=null) { // 로그인 상태인 경우
//				
//				// 회원번호를 map에 추가
//				board.setMemberNo(loginMember.getMemberNo());
//				
//				// 좋아요 여부 확인 서비스 호출 
//				int result = service.feedLikeCheck(board);
//				
//				// 누른적이 있다면
//				if(result>0) model.addAttribute("likeCheck","on");
//				
//				
//			}
//			
//		}
//		
//		
//		return board;
//	}
//	
//	
//	@PostMapping("/mainFeed/like")
//	@ResponseBody // 반환되는 값이 비동기 요청한 곳으로 돌아가게 한다
//	public int like(@RequestBody Map<String, Integer> paramMap) {
//		System.out.println(paramMap);
//		
//		
//		return service.like(paramMap);
//	}
	
	// 좋아요 처리 
		@PostMapping("/mainFeed/like")
		@ResponseBody
		public int feedLike( Model model
				,@SessionAttribute(value="loginMember",required=false) Member loginMember
				// 세션에서 loginMember를 얻어오는데 없으면 null 있으면 회원정보 저장
				,Board board
				,@RequestBody Map<String, Integer> paramMap) {
			
				
//				board.setMemberNo(loginMember.getMemberNo());
//				
//				int result = service.feedLikeCheck(board);
//				System.out.println(result);
//				if(result>0) {
//					model.addAttribute("likeCheck");
//				}
				
			
			
			System.out.println(paramMap);
			
			
			return service.like(paramMap);
		}
	
	

	
}