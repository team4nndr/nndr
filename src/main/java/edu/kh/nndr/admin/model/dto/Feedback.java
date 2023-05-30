package edu.kh.nndr.admin.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Feedback {
	private int feedbackNo;
	private int memberNo;
	private String memberName;
	private String feedbackContent;
	private String feedbackDate;
	private String adminNo;
	private String adminComment;
	private String confirmFlag;
	private String confirmDate;
}