package edu.kh.nndr.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.member.model.dto.Member;

@Repository // Persistance Layer, 영속성 관련 클래스(파일, DB 관련 클래스) + Bean 등록(=spring에 의해 객체 생성됨)
public class MemberDAO {
	
	// SqlSessionTemplate (마이바티스 객체) DI
	@Autowired // 등록된 Bean 중에서 SqlSessionTemplate 타입의 Bean 주입 
	private SqlSessionTemplate sqlSession;

	public Member test() {
		
		// MyBatis를 이용해서 1행 조회(selectOne)
		// sqlSession.selectOne("namespace값.id값", 전달할 값);
		// -> namespace가 일치하는 Mapper에서 id가 일치하는 SQL구문 수행 후 결과를 1행(dto, 기본자료형) 반환
		return sqlSession.selectOne("memberMapper.test");
	}

	// 로그인
	public Member login(Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.login", map);
	}
	
	// 회원 가입
	public int signUp(Member inputMember) {
		int result = sqlSession.insert("memberMapper.signUp",inputMember); // 성공한 행의 개수
		
		if(result >0) result = inputMember.getMemberNo();
		
		return result;
	}
	
	// 회원 가입 추가
	public int signUpPlus(Member inputMember) {
		return sqlSession.insert("memberMapper.signUpPlus",inputMember);
	}
	
	
}
