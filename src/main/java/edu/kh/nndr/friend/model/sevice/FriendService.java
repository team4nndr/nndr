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


	
}
