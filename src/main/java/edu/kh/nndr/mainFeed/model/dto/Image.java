package edu.kh.nndr.mainFeed.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Image {

	
	// 이미지 
	private int imgNo;
	private String imgPath;
	private int imgIndex;
	private int boardNo;
}
