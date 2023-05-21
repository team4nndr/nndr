package edu.kh.nndr.mainFeed.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.mainFeed.model.dao.MentionDAO;
import edu.kh.nndr.member.model.dto.Member;

@Service
public class MentionServiceImpl implements MentionService {
	
	@Autowired 
	private MentionDAO dao;

	@Override
	public List<Member> mention(Map<String, Object> paramMap) {
		return dao.mention(paramMap);
	}

} 	
