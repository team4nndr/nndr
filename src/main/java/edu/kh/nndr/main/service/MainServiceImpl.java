package edu.kh.nndr.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.nndr.main.dao.MainDAO;

@Service // IOC 
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	// 이메일 인증 확인(비밀번호 바꾸기)
	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

	// 새 계정 만들기(이메일 유효성 확인)
	@Override
	public int email(String inputEmail) {
		return dao.email(inputEmail);
	}
	
	// 비밀번호 찾기 => 이메일 유효성 검사
	@Override
	public int emailDup(String emailDup) {
		return dao.emailDup(emailDup);
	}
	
	// 비밀번호 변경 서비스
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int changePw(String newPw, int memberNo) {
		
		// 1. 현재 비번, DB에 저장된 비번 비교
		// 1) 회원번호가 일치하는 MEMBER테이블 행의 MEMBER_PW 조회
		String encPw = dao.selectEncPw(memberNo);
		
		// 2) bcrypt.matches(평문,암호문) -> 같으면 true -> 비번 수정
		if(bcrypt.matches(newPw,encPw)) {
			
			// 2. 비밀번호 변경(UPDATE DAO 호출)(bcrypt 새로운 비번 암호화) -> 결과 반환
			return dao.changePw(bcrypt.encode(newPw), memberNo);
			
		}
		
		// 3) 비번이 일치하지 않으면 0 반환
		return 0;
	}

	@Override
	public int changePw(String newPw, String findEmail) {
		
		return dao.changePw(bcrypt.encode(newPw),findEmail);
	}
	
	

	
	
	
	
	
}
