package edu.kh.nndr.mainFeed.model.dao;


import java.util.List;
import java.util.Map;

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

	// 게시글 삭제
	public int feedDelete(Board board) {
		
		return sqlSession.update("mainFeedMapper.feedDelete",board);
	}

	// 게시글 업데이트 
	public int feedUpdate(Board board) {
		
		return sqlSession.update("mainFeedMapper.feedUpdate",board);
	}

	
	
	// 게시글 업데이트 이미지 삭제
	public int imageDelete(Map<String, Object> deleteMap) {
		
		
		return sqlSession.delete("mainFeedMapper.imageDelete",deleteMap);
	}

	
	// 게시글 업데이트 이미지 수정
	public int imageUpdate(Image img) {
		
		return sqlSession.update("mainFeedMapper.imageUpdate",img);
	}

	
	
	// 게시글 수정 (1개)이미지 삽입 
	public int imgInsert(Image img) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mainFeedMapper.imgInsert",img);
	}
	
	
}
