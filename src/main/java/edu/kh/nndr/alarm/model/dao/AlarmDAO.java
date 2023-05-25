package edu.kh.nndr.alarm.model.dao;

import java.util.Map;

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

	/**
	 * 알람 수신 설정 여부 조회
	 * @param map
	 * @return
	 */
	public Object checkAlarmSetting(Map<String, Object> map) {
		return sqlSession.selectOne("alarmMapper.checkAlarmSetting", map);
	}

	/** 알람 넘버 체크
	 * @return
	 */
	public Alarm checkAlarmNo() {
		return sqlSession.selectOne("alarmMapper.checkAlarmNo");
	}

	public int alarmDel(String alarmDel) {
		return sqlSession.update("alarmMapper.alarmDel", alarmDel);
	}

	public int alarmAllDel(int memberNo) {
		return sqlSession.update("alarmMapper.alarmAllDel", memberNo);
	}

}
