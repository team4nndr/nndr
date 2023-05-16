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
	public List<Friend> friendRqList(int memberNo) {
		return dao.friendRqList(memberNo);
	}

	@Override
	public int friendUpdate(int friendNo) {
		return dao.friendUpdate(friendNo);
	}



	
	



}
