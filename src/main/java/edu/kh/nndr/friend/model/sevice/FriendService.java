package edu.kh.nndr.friend.model.sevice;

import java.util.List;
import java.util.Map;

import edu.kh.nndr.friend.model.dto.Friend;

public interface FriendService {

	/** 친구 요청 목록 조회
	 * @param memberNo
	 * @return
	 */
	List<Friend> friendRqList(int memberNo);

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

	/** 모든 친구 목록 조회
	 * @param memberNo
	 * @return
	 */
	List<Friend> friendListAll(int memberNo);

	/** 친구 검색
	 * @param map
	 * @return
	 */
	List<Friend> friendListsearch(Map<String, Object> map);


}
