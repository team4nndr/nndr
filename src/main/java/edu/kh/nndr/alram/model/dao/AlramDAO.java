package edu.kh.nndr.alram.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AlramDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
