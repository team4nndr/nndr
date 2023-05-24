package edu.kh.nndr.topMenu.service;

import java.util.List;
import edu.kh.nndr.alarm.model.dto.Alarm;

public interface TopMenuService {

	/** 알람 목록 조회
	 * @param alarm
	 * @return list
	 */
	List<Alarm> alarmList(int memberNo);
}