package edu.kh.nndr.friend.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Friend {
	
	private int friendNo;
	private int friendSender;
	private int friendReciver;
	private String friendFl;
	
}
