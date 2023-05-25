package edu.kh.nndr.alarm.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.alarm.model.dao.AlarmDAO;
import edu.kh.nndr.alarm.model.dto.Alarm;

/**
 * @author user1
 *
 */
@Service
public class AlarmServiceImpl implements AlarmService {

	@Autowired
	private AlarmDAO dao;
	
	
	@Override
	public int insertAlarm(Alarm alarm) {
		return dao.insertAlarm(alarm);
	}


	// DB에 알람 내용 저장
	@Override
	public int insert(Alarm alarm) {
		return dao.insert(alarm);
	}


	// 알람 수신 설정 여부 조회
	@Override
	public boolean checkAlarmSetting(Map<String, Object> map) {
		return dao.checkAlarmSetting(map).equals("Y");
	}


	/** 알람 번호 확인
	 *
	 */
	@Override
	public Alarm checkAlarmNo() {
		return dao.checkAlarmNo();
	}


	@Override
	public int alarmDel(String alarmDel) {
		return dao.alarmDel(alarmDel);
	}


	

	
}
