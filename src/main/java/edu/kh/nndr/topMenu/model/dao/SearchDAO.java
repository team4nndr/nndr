package edu.kh.nndr.topMenu.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.member.model.dto.Member;

/**
 * @author 이예슬
 *
 */
@Repository
public class SearchDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;



	/** 이름이 일치하는 회원 조회
	 * @param query
	 * @return list
	 */
	public List<Member> friendNameList(Map<String, Object> map) {
		return sqlSession.selectList("memberMapper.searchMember", map);
	}

	/** 검색어 입력 시, 검색어와 일치하는 목록 조회(게시글 목록)
	 * @param query
	 * @return list
	 */
	public List<Board> matchingList(String query) {
		return sqlSession.selectList("mainFeedMapper.matchingList", query);
	}
}
