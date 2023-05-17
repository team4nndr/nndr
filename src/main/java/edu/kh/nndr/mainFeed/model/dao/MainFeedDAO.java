package edu.kh.nndr.mainFeed.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.member.model.dto.Member;

@Repository
public class MainFeedDAO {

	@Autowired
	private SqlSessionTemplate  sqlSession;

	/** 게시글 확인
	 * @param boardNo
	 * @return
	 */



	public Board feedContent(int memberNo) {
		
		
		return sqlSession.selectOne("mainFeedMapper.feedContent",memberNo);
	}

	public List<Board> feedList() {
		
		return sqlSession.selectList("mainFeedMapper.feedList");
	}
	
	
}
