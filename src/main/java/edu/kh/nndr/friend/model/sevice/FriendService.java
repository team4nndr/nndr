package edu.kh.nndr.friend.model.sevice;

import edu.kh.nndr.friend.model.dto.Friend;

public interface FriendService {

	/** 친구요청 조회
	 * @param friend
	 * @param friendNo
	 * @param friendSender
	 * @return 
	 */
	int friendRequest(Friend friend, int friendNo, int friendSender);

}
