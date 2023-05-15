package edu.kh.nndr.mainFeed.model.dto;

import java.util.List;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Hashtag {
	
	private int hashtagNo;
	private String hashtagKeyword;
	
	private List<Hashtag> hashtagList;
}
