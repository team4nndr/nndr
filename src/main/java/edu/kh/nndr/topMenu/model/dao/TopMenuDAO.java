package edu.kh.nndr.topMenu.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.alram.model.dto.Alram;


@Repository
public class TopMenuDAO {
	
	private SqlSessionTemplate sqlSession;

	public List<Alram> alramList(int memberNo) {
		return sqlSession.selectList("alramMapper.alramList", memberNo);
	}

}
