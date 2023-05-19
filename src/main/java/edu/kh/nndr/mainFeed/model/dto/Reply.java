package edu.kh.nndr.mainFeed.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성
@Setter
@Getter
@ToString
public class Reply {
	private int replyNo;
	
	private String replyContent;
	private String  replyDate;
	private String replyDelete;
	private int memberNo;
	private int boardNo;
	private int parentReplyNo;
	
	private String memberName;
	private String setFriendReq;
	private String setAlarmReply;
	private String setAlarmLike;
	private String setAlarmTag;
	private String setAlarmReqAccept;
	
	private String profileImage;
}
