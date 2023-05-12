package edu.kh.nndr.friend.model.sevice;

import java.util.HashMap;
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
	public int friendRequest(Friend friend, int friendNo, int friendSender) {
		Map<String, Object> reQuestMap = new HashMap<>();
		reQuestMap.put ("friendNo", friendNo);
		reQuestMap.put ("friendSender", friendSender);
		int resultFriendRq = dao.friendRequest(reQuestMap);
		return resultFriendRq;
	}

}
