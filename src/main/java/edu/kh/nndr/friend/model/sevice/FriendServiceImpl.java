package edu.kh.nndr.friend.model.sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.friend.model.dao.FriendDAO;
import edu.kh.nndr.friend.model.dto.Friend;

@Service
public class FriendServiceImpl implements FriendService{

	@Autowired
	private FriendDAO dao;

	@Override
	public Map<String, Object> selectFrendRq(int friendReciver, int friendSender) {
		List<Friend> friendList = dao.selectFrendRq(friendReciver, friendSender);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("friendList",friendList);
		return map;
	}



	
	



}
