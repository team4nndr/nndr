package edu.kh.nndr.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.admin.model.dao.FeedbackDAO;
import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.admin.model.dto.Pagination;

@Service
public class FeedbackServiceImpl implements FeedbackService {
	
	@Autowired
	private FeedbackDAO dao;

	// 의견 목록 조회
	@Override
	public Map<String, Object> selectFeedbackList(int cp) {
		int listCount = dao.getFeedbackCount();
		Pagination pagination = new Pagination(listCount, cp);
		
		List<Feedback> feedbackList = dao.selectFeedbackList(pagination);
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("feedbackList", feedbackList);
		
		return map;
	}
	
	// 상세 의견 조회
	@Override
	public Feedback getFeedback(int feedbackNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
