package edu.kh.nndr.friend.model.sevice;

import java.util.List;
import java.util.Map;

import edu.kh.nndr.friend.model.dto.Friend;

public interface FriendService {

	Map<String, Object> selectFrendRq(int friendReciver, int friendSender);

	


	
}
