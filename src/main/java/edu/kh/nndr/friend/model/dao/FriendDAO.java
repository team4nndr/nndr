package edu.kh.nndr.friend.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FriendDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int friendRequest(Map<String, Object> reQuestMap) {
		return sqlSession.selectOne("friendMapper.friendRequest", reQuestMap);
	}
	

}
