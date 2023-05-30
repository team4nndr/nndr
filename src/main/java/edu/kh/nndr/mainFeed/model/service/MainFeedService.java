package edu.kh.nndr.mainFeed.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.member.model.dto.Member;

public interface MainFeedService {



	/** 게시글 확인
	 * @param boardNo
	 * @return
	 */
	List<Board> feedList(int memberNo);
	
	

	/** 게시글 등록
	 * @param board
	 * @param images
	 * @param webPath
	 * @param filePath
	 * @return
	 */
	int feedInsert(Board board, List<MultipartFile> images, String webPath, String filePath)
			throws IllegalStateException, IOException;


	// 게시글 삭제
	int feedDelete(Board board);


	// 게시글 수정 
	int feedUpdate(Board board, List<MultipartFile> images, String webPath, String filePath, String deleteList)
			throws IllegalStateException, IOException;


	//  게시글 수정을 위한 게시글 하나 확인
	Board selectOne(int boardNo);

	// 좋아요 체크
	int feedLikeCheck(Map<String, Object> map);


	// 좋아요 처리 
	int like(Map<String, Integer> paramMap);
	
	
	/** 개인피드 게시글 
    * @param no
    * @return
    */
   List<Board> personalFeedList(int no);







	
	
	

}
