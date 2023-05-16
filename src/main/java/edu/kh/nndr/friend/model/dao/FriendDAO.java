package edu.kh.nndr.friend.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.friend.model.dto.Friend;

@Repository
public class FriendDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public List<Friend> friendRqList(int memberNo) {
		 return sqlSession.selectList("friendMapper.friendRqList", memberNo);
	}


	public int friendUpdate(int friendNo) {
		return sqlSession.update("friendMapper.friendUpdate",friendNo);
	}


}
