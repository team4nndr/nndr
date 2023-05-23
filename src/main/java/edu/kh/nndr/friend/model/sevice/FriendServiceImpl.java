package edu.kh.nndr.friend.model.sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.friend.model.dao.FriendDAO;
import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.member.model.dto.Member;

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

	

	@Override
	public int friendDelete(int friendNo) {
		return dao.friendDelete(friendNo);
	}

	
//	모든친구 목록 조회
	@Override
	public List<Friend> friendListAll(int memberNo) {
		return dao.friendListAll(memberNo);
	}

	@Override
	public List<Friend> friendListsearch(Map<String, Object> map) {
		return dao.friendListsearch(map);
	}
	
	// 로그인 시 친구목록 조회
	@Override
	public List<Member> friendListMember(int memberNo) {
		return dao.friendListMember(memberNo);
	}




}
