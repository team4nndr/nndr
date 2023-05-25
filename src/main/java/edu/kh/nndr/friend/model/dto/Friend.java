package edu.kh.nndr.friend.model.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Friend implements Serializable {
	
	private int friendNo;
	private int friendSender;
	private int friendReciver;
	private String friendFl;
	
//	member join
	private int memberNo;
	private String memberName;
}
