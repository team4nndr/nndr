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

	public List<Friend> selectFrendRq(int friendReciver, int friendSender) {
		// TODO Auto-generated method stub
		return null;
	}


	



	

}
