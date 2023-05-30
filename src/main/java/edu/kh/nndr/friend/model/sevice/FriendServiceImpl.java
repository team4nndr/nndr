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
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDAO dao;

	//친구 요청목록
	@Override
	public List<Member> friendRqList(int memberNo) {
		return dao.friendRqList(memberNo);
	}

	//친구요청 확인 
	@Override
	public int friendUpdate(int friendNo) {
		return dao.friendUpdate(friendNo);
	}

	//친구 삭제
	@Override
	public int friendDelete(int friendNo) {
		return dao.friendDelete(friendNo);
	}

//친구 검색
	@Override
	public List<Member> friendListsearch(Map<String, Object> map) {
		return dao.friendListsearch(map);
	}

	// 로그인 시 친구목록 조회
	@Override
	public List<Member> friendListMember(int memberNo) {
		return dao.friendListMember(memberNo);
	}

//	친구추천

	@Override
	public List<Member> friendSuggestion(Map<String, Object> params) {
		return dao.friendSuggestion(params);

	}

	
	//친구추천 수락버튼
	@Override
	public int friendaddition(Map<String, Object> map) {
		return dao.friendaddition(map);
	}

}
