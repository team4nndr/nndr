package edu.kh.nndr.topMenu.model.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.mainFeed.model.dto.Hashtag;

@Repository
public class SearchDAO {
	
	private SqlSessionTemplate sqlSession;

	/** 해시태그 목록 조회 DAO
	 * @return list
	 */
		    
	    public List<Hashtag> getTags(String hashtagKeyword) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("keyword", "%" + hashtagKeyword + "%");

	        return sqlSession.selectList("searchMapper.selectHashTagList", params);
	    }
	}



