package edu.kh.nndr.topMenu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.topMenu.model.dao.SearchDAO;

@Service

public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchDAO dao;

	
	
	/**
	 * 일치하는 친구이름 검색어 조회
	 */
	@Override
	public List<Member> friendNameList(Map<String, Object> map) {
		return dao.friendNameList(map);
	}



	/**
	 * 검색어와 일치하는 피드 가져오기
	 */
	@Override
	public List<Board> matchingList(String query) {
		
		return dao.matchingList(query);
	}

	


	

}







