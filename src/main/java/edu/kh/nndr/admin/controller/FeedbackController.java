package edu.kh.nndr.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	@GetMapping("/{feedbackNo}")
	public String feedbackDetail(@PathVariable("feedbackNo") int feedbackNo, Model model) {
		Feedback feedback = service.getFeedback(feedbackNo);
		model.addAttribute("feedback", feedback);
		return "admin/feedback_detail";
	}
}
