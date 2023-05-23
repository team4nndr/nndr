package edu.kh.nndr.topMenu.service;

import java.util.List;

import edu.kh.nndr.alarm.dto.Alarm;

public interface TopMenuService {

	/** 알람 목록 조회
	 * @param alram
	 * @return list
	 */
	List<Alarm> alarmList(Alarm alarm);

}
