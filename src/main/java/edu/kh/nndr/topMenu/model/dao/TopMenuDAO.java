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
  
	// session에 있는 알람 리스트를 얻어와 화면에 출력
	public List<Alarm> alarmList(int memberNo) {
		return sqlSession.selectList("alarmMapper.alarmList", memberNo);
	}

}
