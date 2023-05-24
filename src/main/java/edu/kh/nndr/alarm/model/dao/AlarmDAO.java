package edu.kh.nndr.alarm.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.alarm.model.dto.Alarm;

@Repository
public class AlarmDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertAlarm(Alarm alarm) {
		return sqlSession.insert("alarmMapper.friendAlarm", alarm);
	}

	/**
	 * DB에 알람 내용 저장
	 * @param alarm
	 * @return result
	 */
	public int insert(Alarm alarm) {
		return sqlSession.insert("alarmMapper.insert", alarm);
	}

}
