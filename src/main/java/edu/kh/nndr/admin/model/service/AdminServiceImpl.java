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
		// 1. 유저 수 조회
		int listCount = dao.getMemberCount();
		
		// 2. 1번 조회 결과 + cp를 이용해서 Pagination 객체 생성
		Pagination pagination = new Pagination(listCount, cp);
		
		// 3. 특정 게시판에서 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		List<Member> memberList = dao.selectMemberList(pagination);
		
		// 4. pagination, boardList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("userList", memberList);
		return map;
	}

}
