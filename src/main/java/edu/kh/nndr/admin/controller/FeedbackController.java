package edu.kh.nndr.admin.controller;

import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.admin.model.service.FeedbackService;

@Controller
@RequestMapping("/admin/feedback")
public class FeedbackController {
	
	@Autowired
	private FeedbackService service;

	// 의견 목록 조회
	@GetMapping("")
	public String selectFeedbackList(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			Model model) {
		Map<String, Object> map = service.selectFeedbackList(cp);
		model.addAttribute("map", map);
		return "admin/feedback";
	}
	
	// 상세 의견 조회
	@GetMapping("/{feedbackNo:[0-9]+}")
	public String feedbackDetail(@PathVariable("feedbackNo") int feedbackNo, Model model) {
		Feedback feedback = service.getFeedback(feedbackNo);
		model.addAttribute("feedback", feedback);
		return "admin/feedback_detail";
	}
	
	// 회원 의견 처리 + 관리자 코멘트
	@PostMapping("/{feedbackNo:[0-9]+}/confirm")
	public String confirmComment(
			Feedback feedback, 
			@RequestParam("cp") int cp,
			@PathVariable("feedbackNo") int feedbackNo, 
			RedirectAttributes ra) {
		feedback.setFeedbackNo(feedbackNo);
		int result = service.confirmFeedback(feedback);
		
		String message = null;
		if(result>0) {
			message = "의견이 정상적으로 처리되었습니다.";
		} else {
			message = "의견 처리 실패";
		}
		
		ra.addFlashAttribute("message", message);
		return "redirect:/admin/feedback/" + feedbackNo + "?cp=" + cp;
	}
}
