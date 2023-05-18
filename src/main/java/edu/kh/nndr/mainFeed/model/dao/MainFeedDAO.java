package edu.kh.nndr.mainFeed.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.dto.Image;
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

	/** 게시글 확인
	 * @return
	 */
	public List<Board> feedList() {
		
		return sqlSession.selectList("mainFeedMapper.feedList");
	}

	public int feedInsert(Board board) {
		int result = sqlSession.insert("mainFeedMapper.feedInsert",board);
		
		if(result >0 ) result = board.getBoardNo();
		
		return result;
	}

	/** 게시글 이미지 등록
	 * @param uploadList
	 * @return
	 */
	public int insertImageList(List<Image> uploadList) {
		
		int result = sqlSession.insert("mainFeedMapper.insertImageList",uploadList);
		
		return result;
	}
	
	
}
