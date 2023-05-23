package edu.kh.nndr.member.model.service;

import java.util.Map;

import edu.kh.nndr.member.model.dto.Member;

// Service Interface 사용 이유
// 1. 프로젝트에 규칙성 부여
// 2. 클래스간의 결합도 약화 (객체지향적 설계)
//	  -> 유지보수성 향상
// 3. Spring AOP 사용
//    -> AOP는 Spring-proxy를 이용해서 동작하는데, 이 때 Service 인터페이스가 필요
public interface MemberService {

	/**
	 * 로그인
	 * @param map
	 * @return member
	 */
	Member login(Map<String, Object> map);

	/** 회원 가입 
	 * @param inputMember
	 * @return result 
	 */
	int signUp(Member inputMember);
}
