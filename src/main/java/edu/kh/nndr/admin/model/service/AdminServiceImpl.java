package edu.kh.nndr.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.admin.model.dao.AdminDAO;
import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.admin.model.dto.Pagination;
import edu.kh.nndr.member.model.dto.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	// 유저 목록 조회
	@Override
	public Map<String, Object> selectMemberList(int cp) {
		int listCount = dao.getMemberCount();
		Pagination pagination = new Pagination(listCount, cp);
		
		List<Member> memberList = dao.selectMemberList(pagination);
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("memberList", memberList);
		
		return map;
	}

	// 유저 상세 조회
	@Override
	public Member selectMember(int memberNo) {
		return dao.selectMember(memberNo);
	}

}
