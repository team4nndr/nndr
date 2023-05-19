package edu.kh.nndr.mainFeed.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.nndr.common.utility.Util;
import edu.kh.nndr.mainFeed.model.dao.MainFeedDAO;
import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.mainFeed.model.dto.Image;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.mainFeed.model.exception.FileUploadException;


@Service
public class MainFeedServiceImpl implements MainFeedService {

	@Autowired
	private MainFeedDAO dao;

	
	// 게시글 확인
	@Override
	public List<Board> feedList() {
		
		return dao.feedList();
	}

	
	// 게시글 등록 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int feedInsert(Board board, List<MultipartFile> images, String webPath, String filePath) throws IllegalStateException, IOException {
		
		//board.setBoardText(Util.XSSHandling(board.getBoardText()));
		
		int boardNo = dao.feedInsert(board);
		
		if(boardNo > 0 ) {
			
			// images에 담겨있는 파일 중 실제 업로드된 파일만 분류
			List<Image> uploadList = new ArrayList<Image>();
			for(int i=0; i <images.size(); i++) {
				
				if(images.get(i).getSize()>0) {
					
					Image img = new Image();
					
					// img에 파일 정보를 담아서 uploadLIst에 추가
					img.setImgPath(webPath); // 웹 접근 경로
					img.setBoardNo(boardNo);
					img.setImgOrder(i);
					
					// 파일 원본 이름
					String fileName = images.get(i).getOriginalFilename();
					
					img.setImgOriginal(fileName);// 원본명
					
					img.setImgReName(Util.fileRename(fileName));
					
					
					uploadList.add(img);
				}
				
				
			}
			
			if(!uploadList.isEmpty()) {
				// BOARD_IMG 테이블에 insert하는 DAO호출
				
				int result = dao.insertImageList(uploadList);
				
				// result == 삽입된 행의 개수 == uploadList.size();
				if(result == uploadList.size()) {
					// 서버에 파일을 저장 (transferTo())
					
					// images : 실제 파일이 담긴 객체 리스트
					//			(업로드 안된 인덱스는 빈칸)
					
					// uploadList : 업로드된 파일의 정보(원본명,변경명,순서,경로,게시글번호)
					
					for(int i =0; i<uploadList.size(); i++) {
						int index  = uploadList.get(i).getImgOrder();
						
						// 파일로 변환
						String rename = uploadList.get(i).getImgReName();
						images.get(index).transferTo(new File(filePath+rename));
					}
					
					
					
				}else { // 일부 또는 전체 insert 실패 
					
					// ** 웹 서비스 수행 중 1개라도 실패하면 전체 실패 **
					// -> rollback 필요  
					
					// @Transactional(rollbackFor = Exception.class)
					// -> 예외가 발생해야지만 롤백
					
					// [결론]
					// 예외를 강제 발생 시켜서 rollback 해야함
					// -> 사용자 정의 예외 생성 
					
					throw new FileUploadException();
					
		
			
			
			
		} 
			
			
		}
		
		
	
		
	}
		return boardNo;


	
	
	

	

	
	
	
	
	}

}
