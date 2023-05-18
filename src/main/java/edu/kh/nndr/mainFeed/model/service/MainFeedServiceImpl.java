package edu.kh.nndr.mainFeed.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.mainFeed.model.dao.MainFeedDAO;
import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.member.model.dto.Member;

@Service
public class MainFeedServiceImpl implements MainFeedService {

	@Autowired
	private MainFeedDAO dao;

	@Override
	public List<Board> feedList() {
		
		return dao.feedList();
	}

	
	
	

	

	
	
	
	
	

}
