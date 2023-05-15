package edu.kh.nndr.topMenu.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.topMenu.model.DAO.SearchDAO;

@Service

public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchDAO dao;

	// 해시태그 목록 조회
	    

	@Override
	public List<Hashtag> getTags(String hashtagKeyword) {
		return dao.getTags(hashtagKeyword);
	}

	

	}







