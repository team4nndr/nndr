package edu.kh.nndr.alarm.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Alarm {
	int alarmNo;
	String alarmContent;
	String alarmDate;
	String alarmFl;
	int memberNo;
}
