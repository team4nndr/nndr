package edu.kh.nndr.alarm.model.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Alarm implements Serializable {
	private int alarmNo;
	private String alarmContent;
	private String alarmDate;
	private String alarmFl;
	private int memberNo;
	
	private String content;
	private String type;
	
	// 알람 종류
	public enum Type { 
        FRIEND_REQ("SET_AL_FRIEND_REQ"), 	
        FRIEND_ACCEPT("SET_AL_REQ_ACCEPT"), 
        MENTION("SET_AL_TAG"), 					
        REPLY("SET_AL_REPLY"), 				
        LIKE("SET_AL_LIKE"), 				
        SHARE("SET_AL_SHARE"),   			
        FEED("SET_AL_FEED");
		
		final private String column;
		
        Type(String column) {
        	this.column = column;
        }
        
        public String column() {
        	return column;
        }
    }
}
