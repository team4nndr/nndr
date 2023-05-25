package edu.kh.nndr.topMenu.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.member.model.dto.Member;

@Repository
public class SearchDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 해시태그 목록 조회 DAO
	 * @param query
	 * @return list
	 */
	
	public List<Hashtag> getTags(String query) {
		return sqlSession.selectList("searchMapper.getTags", query);
	}


	/** 이름이 일치하는 회원 조회
	 * @param query
	 * @return list
	 */
	public List<Member> friendNameList(Map<String, Object> map) {
		return sqlSession.selectList("memberMapper.searchMember", map);
	}
	

}
