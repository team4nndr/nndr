package edu.kh.nndr.alram.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Alram {
	
	int alramNo;

	int senderMemberNo;
	String senderProfile;
	String senderHref;
	int reciverMemberNo;
	String content;
	String friendButton;
	
	

}
