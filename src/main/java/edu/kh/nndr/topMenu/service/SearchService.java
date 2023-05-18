package edu.kh.nndr.topMenu.service;

import java.util.List;
import java.util.Map;

import edu.kh.nndr.mainFeed.model.dto.Hashtag;

public interface SearchService {

	/** 해시태그 목록 조회 서비스
	 * @return list
	 */

	List<Hashtag> getTags(String query);

	
}
