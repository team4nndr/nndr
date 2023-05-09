package edu.kh.nndr.member.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class MemberInfo {
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberName;
	private String memberTel;
	private String accountCondition;
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
//	private int memberNo
	private String infoIntro;
	private String infoHobby;
	private String infoGender;
	private String infoBirth;
	private String infoImg;
	private String infoJob;
	private String infoCollege;
	private String infoHigh;
	private String infoMiddle;
	private String infoElementary;
	private String infoResidence;
	private String infoBirthplace;
	private String infoSns;
	private String infoLang;
	private String romanticYn;
	private String infoNick;
	private String infoText;
	private String infoBack;
	private String infoProfile;
}

