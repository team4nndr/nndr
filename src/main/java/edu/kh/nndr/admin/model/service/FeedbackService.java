package edu.kh.nndr.admin.model.service;

import java.util.Map;

import edu.kh.nndr.admin.model.dto.Feedback;

public interface FeedbackService {

	/**
	 * 의견 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectFeedbackList(int cp);
	
	/**
	 * 상세 의견 조회
	 * @param feedbackNo
	 * @return feedback
	 */
	Feedback getFeedback(int feedbackNo);

	/**
	 * 회원 의견 처리
	 * @param feedback
	 * @return result
	 */
	int confirmFeedback(Feedback feedback);

	/**
	 * 회원 의견 검색 결과 조회
	 * @param paramMap
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectFeedbackList(Map<String, Object> paramMap, int cp);
}
