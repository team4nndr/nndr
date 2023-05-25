package edu.kh.nndr.mainFeed.model.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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
	public List<Board> feedList(int memberNo) {
		
		return sqlSession.selectList("mainFeedMapper.feedList",memberNo);
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
		
		return sqlSession.insert("mainFeedMapper.imgInsert",img);
	}

	public Board selectOne(int boardNo) {
		return sqlSession.selectOne("mainFeedMapper.selectOne", boardNo);
	}
	

	// 좋아요 체크
	public int feedLikeCheck(Map<String, Object> map) {
		
		return sqlSession.selectOne("mainFeedMapper.feedLikeCheck",map);
	}

	// 좋아요 추가 
	public int insertLike(Map<String, Integer> paramMap) {
		
		return sqlSession.insert("mainFeedMapper.insertLike",paramMap);
	}
	
	// 좋아요 삭제 
	public int deleteLike(Map<String, Integer> paramMap) {
		
		return sqlSession.delete("mainFeedMapper.deleteLike",paramMap);
	}

	// 현재 좋아요의 개수 
	public int countContentLike(Integer boardNo) {
		
		
		return sqlSession.selectOne("mainFeedMapper.countContentLike",boardNo);
	}
	
	   /** 개인피드 게시글 확인 다오
	    * @param no
	    * @return
	    */
	   public List<Board> personalFeedList(int no) {
	      return sqlSession.selectList("mainFeedMapper.personalFeedList",(no));
	}
	
	
	
}
