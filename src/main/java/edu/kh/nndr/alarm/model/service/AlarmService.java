package edu.kh.nndr.alarm.model.service;

import java.util.Map;

import edu.kh.nndr.alarm.model.dto.Alarm;

public interface AlarmService {
	public int insertAlarm(Alarm alarm);

	/**
	 * DB에 알람 내용 저장
	 * @param alarm
	 * @return result
	 */
	public int insert(Alarm alarm);

	/**
	 * 알람 수신 설정 여부 확인
	 * @param map
	 * @return true / false
	 */
	public boolean checkAlarmSetting(Map<String, Object> map);

	/** 알람 넘버 확인(최신순)
	 * @return
	 */
	public Alarm checkAlarmNo();

	/** 알람 삭제
	 * @param alarmDel
	 * @return
	 */
	public int alarmDel(String alarmDel);

	/** 알람 모두 삭제
	 * @param i
	 * @return
	 */
	public int alarmAllDel(int i);

	
	
}
