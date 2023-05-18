package edu.kh.nndr.topMenu.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.mainFeed.model.dto.Hashtag;

@Repository
public class SearchDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 해시태그 목록 조회 DAO
	 * @return list
	 */
	
	public List<Hashtag> getTags(String query) {
		return sqlSession.selectList("searchMapper.getTags", query);
	}

}
