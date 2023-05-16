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
	private String boardText;
	private String uploadDate;
	private String contentLike;
	private String delete;
	
	// 서브쿼리
	private int memeberNo;
	private int commentCount; // 댓글 수 
    private int likeCount;
    private String memberName;
    
	// 이미지 리스트
	
	private List<Image> imageList;
	
	
	// 댓글 리스트
	private List<Reply> replyList;
	
	
	
	
	
	
	
}
