package edu.kh.nndr.topMenu.service;

import java.util.List;
import java.util.Map;

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.member.model.dto.Member;

public interface SearchService {

	/** 해시태그 목록 조회 서비스
	 * @param query
	 * @return list
	 */
	List<Hashtag> getTags(String query);

	/** 일치하는 친구 목록 조회(검색)
	 * @param map
	 * @return list
	 */
	public List<Member> friendNameList(Map<String, Object> map);

	
	

	
}
