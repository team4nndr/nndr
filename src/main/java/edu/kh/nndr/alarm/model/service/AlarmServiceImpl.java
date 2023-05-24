package edu.kh.nndr.alarm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.alarm.model.dao.AlarmDAO;
import edu.kh.nndr.alarm.model.dto.Alarm;

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



	
}
