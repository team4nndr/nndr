package edu.kh.nndr.friend.model.sevice;

import java.util.List;
import java.util.Map;

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.member.model.dto.Member;

public interface FriendService {

	/** 친구 요청 목록 조회
	 * @param memberNo
	 * @return
	 */
	List<Member> friendRqList(int memberNo);

	/** 친구 수락 버튼 
	 * @param friendNo
	 * @return
	 */
	int friendUpdate(int friendNo);

	/** 친구 거절 버튼
	 * @param friendNo
	 * @return
	 */
	int friendDelete(int friendNo);

	/** 친구 검색
	 * @param map
	 * @return
	 */
	List<Member> friendListsearch(Map<String, Object> map);
	
	/** 로그인 시 현재 친구 목록 조회
	 * @param map
	 * @return List<Member> friendList
	 */
	public List<Member> friendListMember(int memberNo);

//	/** 친구 추천 확인 버튼
//	 * @param memberNo
//	 * @return
//	 */
	int friendaddition(int memberNo);
 
}
