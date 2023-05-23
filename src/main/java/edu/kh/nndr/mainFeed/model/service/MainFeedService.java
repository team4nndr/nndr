package edu.kh.nndr.mainFeed.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.member.model.dto.Member;

public interface MainFeedService {



	/** 게시글 확인
	 * @param boardNo
	 * @return
	 */
	List<Board> feedList();
	
	

	/** 게시글 등록
	 * @param board
	 * @param images
	 * @param webPath
	 * @param filePath
	 * @return
	 */
	int feedInsert(Board board, List<MultipartFile> images, String webPath, String filePath)
			throws IllegalStateException, IOException;



	int feedDelete(Board board);



	int feedUpdate(Board board, List<MultipartFile> images, String webPath, String filePath, String deleteList)
			throws IllegalStateException, IOException;



	Board selectOne(int boardNo);


	


	
	
	

}
