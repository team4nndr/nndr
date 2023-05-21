package edu.kh.nndr.mainFeed.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.member.model.dto.Member;


@Repository
public class MentionDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Member> mention(Map<String, Object> paramMap) {
		return sqlSession.selectList("memberMapper.friendListSearchByName", paramMap);
	}

}
