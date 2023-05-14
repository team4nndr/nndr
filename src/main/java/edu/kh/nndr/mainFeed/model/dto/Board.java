package edu.kh.nndr.mainFeed.model.dto;

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
	private int memeberNo;
	
	
	// 이미지 
	private int imgNo;
	private String imgPath;
	private int imgIndex;
	
	
	
	
}
