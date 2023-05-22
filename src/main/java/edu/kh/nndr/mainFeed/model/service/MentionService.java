package edu.kh.nndr.mainFeed.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.nndr.member.model.dto.Member;

public interface MentionService {

	List<Member> mention(Map<String, Object> paramMap);

}
