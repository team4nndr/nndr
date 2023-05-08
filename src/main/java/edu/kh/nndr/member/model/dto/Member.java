package edu.kh.nndr.member.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberName;
	private String memberTel;
	private String memberCode;
	private String enrollDate;
	private String disableDate;
	private String deleteDate;
	private String setFriendReq;
	private String setFeedAuthority;
	private String setAlarmFriendReq;
	private String setAlarmReqAccept;
	private String setAlarmTag;
	private String setAlarmReply;
	private String setAlarmLike;
	private String setAlarmShare;
	private String setAlarmFeed;
	
	// MEMBER_INFO 필드
	private String profileImage;
	private String infoGender;
	private String infoResidence;
}