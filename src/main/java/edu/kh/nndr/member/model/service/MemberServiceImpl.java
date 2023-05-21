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
	
	// 회원 가입 서비스
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int signUp(Member inputMember) {
		
		// DAO 호출
		// 실패하면 0 성공하면 회원번호
		int result = dao.signUp(inputMember);
		
		if(result>0) {
			//  추가정보 삽입할 때 inputMember에 담겨있는 회원번호 이용
			result = dao.signUpPlus(inputMember);
		}
		
		return result;
	}
}
