package edu.kh.nndr.topMenu.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.alarm.dto.Alarm;


@Repository
public class TopMenuDAO {
	
	private SqlSessionTemplate sqlSession;

	public List<Alarm> alramList(Alarm alram) {
		return sqlSession.selectList("alramMapper.alramList", alram);
	}

}
