package edu.kh.nndr.topMenu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.mainFeed.model.dto.Hashtag;
import edu.kh.nndr.topMenu.model.dao.SearchDAO;

@Service

public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchDAO dao;

	@Override
	public List<Hashtag> getTags(String query) {
		return dao.getTags(query);
	}


	

}







