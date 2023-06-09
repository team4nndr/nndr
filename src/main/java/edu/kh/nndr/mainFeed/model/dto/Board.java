package edu.kh.nndr.mainFeed.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성
@Setter
@Getter
@ToString
public class Board {
	
	private int boardNo;
	private int memberNo;
	private String boardText;
	private String uploadDate;
	private int boardCount;
	private String delete;
	private String updateDate;
	private int othermemNo;
	
	
	// 서브쿼리
	private int commentCount; // 댓글 수 
	private int likeCount; // 좋아요 수
	private String memberName;
    
	// 이미지 리스트
	private List<Image> imageList;
	
	// 댓글 리스트
	private List<Reply> replyList;
	
	// 작성자 프로필사진
	private String profileImage;
}
