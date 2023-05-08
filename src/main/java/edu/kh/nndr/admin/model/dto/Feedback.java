package edu.kh.nndr.admin.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Feedback {
	private String feedbackNo;
	private String memberNo;
	private String feedbackContent;
	private String feedbackDate;
	private String adminNo;
	private String adminComment;
	private String confirmFl;
	private String confirmDate;
}