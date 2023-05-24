package edu.kh.nndr.alarm.model.service;

import edu.kh.nndr.alarm.model.dto.Alarm;

public interface AlarmService {
	public int insertAlarm(Alarm alarm);

	/**
	 * DB에 알람 내용 저장
	 * @param alarm
	 * @return result
	 */
	public int insert(Alarm alarm);

}
