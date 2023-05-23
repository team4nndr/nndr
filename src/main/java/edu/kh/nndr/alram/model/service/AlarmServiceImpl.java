package edu.kh.nndr.alram.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.alram.model.dao.AlarmDAO;
import edu.kh.nndr.alram.model.dto.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService {

	@Autowired
	private AlarmDAO dao;
	
	
	@Override
	public int insertAlarm(Alarm alarm) {
		return dao.insertAlarm(alarm);
	}



	
}
