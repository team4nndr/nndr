package edu.kh.nndr.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.admin.model.dto.Pagination;

@Repository
public class FeedbackDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 의견 목록 수 반환
	public int getFeedbackCount() {
		return sqlSession.selectOne("feedbackMapper.getFeedbackCount");
	}

	// 의견 리스트 조회
	public List<Feedback> selectFeedbackList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("feedbackMapper.selectFeedbackList", null, rowBounds);
	}

	// 상세 의견 조회
	public Feedback getFeedback(int feedbackNo) {
		return sqlSession.selectOne("feedbackMapper.getFeedback", feedbackNo);
	}

	// 회원 의견 처리 
	public int confirmFeedback(Feedback feedback) {
		return sqlSession.update("feedbackMapper.confirmFeedback", feedback);
	}

	// 회원 의견 검색 결과 목록 수 반환
	public int getFeedbackCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("feedbackMapper.getFeedbackSearchCount", paramMap);
	}

	// 회원 의견 검색 결과 조회
	public List<Feedback> selectFeedbackList(Map<String, Object> paramMap, Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("feedbackMapper.selectFeedbackSearchList", paramMap, rowBounds);
	}

}
