package edu.kh.nndr.admin.model.dao;

import java.util.List;

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
		return sqlSession.selectList("feedbackMapper.selectFeedbackList");
	}

}