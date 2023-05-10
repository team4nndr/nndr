package edu.kh.nndr.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.nndr.member.model.dao.MemberDAO;
import edu.kh.nndr.member.model.dto.Member;

@Service // Service Layer
// 1) 비즈니스 로직(데이터 가공, DAO호출, 트랜잭션 제어 등) 명시
// 2) Spring Bean으로 등록
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public Member test() {
		return dao.test();
	}

	// 로그인(임시)
	@Override
	public Member login(Map<String, Object> map) {
		return dao.login(map);
	}
}
