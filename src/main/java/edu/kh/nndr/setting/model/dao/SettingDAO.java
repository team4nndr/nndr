package edu.kh.nndr.setting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.admin.model.dto.Feedback;

@Repository
public class SettingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int feedback(Feedback feedback) {
		return sqlSession.insert("feedbackMapper.feedback", feedback);
	}
}
