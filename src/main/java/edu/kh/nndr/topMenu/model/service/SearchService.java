package edu.kh.nndr.topMenu.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.member.model.dto.Member;

/**
 * @author 이예슬
 *
 */
public interface SearchService {


	/** 일치하는 친구 목록 조회(검색)
	 * @param map
	 * @return list
	 */
	public List<Member> friendNameList(Map<String, Object> map);

	
	
	/** 검색어와 일치하는 검색목록
	 * @param query
	 * @return list
	 */
	List<Board> matchingList(String query);



	
}
