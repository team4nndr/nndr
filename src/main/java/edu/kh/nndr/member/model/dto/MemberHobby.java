package edu.kh.nndr.member.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class MemberHobby {
	private int hobbyNo;
	private int memberNo;
	private String hobby;
}

