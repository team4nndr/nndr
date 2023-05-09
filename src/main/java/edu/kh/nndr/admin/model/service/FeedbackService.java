package edu.kh.nndr.admin.model.service;

import java.util.Map;

import edu.kh.nndr.admin.model.dto.Feedback;

public interface FeedbackService {

	/**
	 * 의견 목록 조회
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectFeedbackList(int cp);
	
	/**
	 * 상세 의견 조회
	 * @param feedbackNo
	 * @return feedback
	 */
	Feedback getFeedback(int feedbackNo);
}