package edu.kh.nndr.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 이메일 인증확인 (비밀번호 바꾸기)
	 * @param email
	 * @return result
	 */
	public int emailCheck(String email) {
		return sqlSession.selectOne("emailCheckMapper.emailCheck",email);
	}

	/** 이메일 중복 확인(새 계정 만들기) 
	 * @param inputEmail
	 * @return result
	 */
	public int email(String inputEmail) {
		return sqlSession.selectOne("emailCheckMapper.email",inputEmail);
	}
	
	
	
}
