package edu.kh.nndr.topMenu.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAO {
	
	private SqlSessionTemplate sqlSession;

	/** 해시태그 목록 조회 DAO
	 * @return list
	 */
	public List<String> selectHashTagList() {
		return sqlSession.selectList("searchMapper.selectHashTagList");
	}

}
