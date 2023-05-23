package edu.kh.nndr.alarm.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.alarm.dto.Alarm;

@Repository
public class AlarmDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertAlarm(Alarm alarm) {
		return sqlSession.insert("alarmMapper.friendAlarm", alarm);
	}

}
