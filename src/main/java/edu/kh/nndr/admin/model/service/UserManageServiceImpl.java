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
public class UserManageServiceImpl implements UserManageService {
	
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

	// 계정 삭제
	@Override
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}

	// 계정 비활성화
	@Override
	public int disableMember(int memberNo) {
		return dao.disableMember(memberNo);
	}

	// 계정 정상화(삭제유저 복구, 비활성 해제)
	@Override
	public int enableMember(int memberNo) {
		return dao.enableMember(memberNo);
	}
	
	// 회원 검색 결과 조회
	@Override
	public Map<String, Object> selectMemberList(Map<String, Object> paramMap, int cp) {
		
		int listCount = dao.getMemberCount(paramMap);
		Pagination pagination = new Pagination(listCount, cp);
		
		List<Member> memberList = dao.selectMemberList(paramMap, pagination);
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("memberList", memberList);
		
		return map;
	}
}
