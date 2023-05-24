package edu.kh.nndr.topMenu.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import edu.kh.nndr.alarm.model.dto.Alarm;



@Repository
public class TopMenuDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
  
	public List<Alarm> alarmList(int memberNo) {
		return sqlSession.selectList("alarmMapper.alarmList", memberNo);
	}

}
