package edu.kh.nndr.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.member.model.dto.Member;

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

	/** 이메일 유효성 확인(새 계정 만들기) 
	 * @param inputEmail
	 * @return result
	 */
	public int email(String inputEmail) {
		return sqlSession.selectOne("emailCheckMapper.email",inputEmail);
	}

	/** 비밀번호 찾기 => 이메일 유효성 검사
	 * @param emailDup
	 * @return result
	 */
	public int emailDup(String emailDup) {
		return sqlSession.selectOne("emailCheckMapper.emailDup", emailDup);
	}

	/** 회원 비밀번호 조회
	 * @param memberNo
	 * @return result
	 */
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("emailCheckMapper.selectEncPw",memberNo);
	}

	/** 비밀번호 변경
	 * @param encode
	 * @param memberNo
	 * @return result
	 */
	public int changePw(String newPw, int memberNo) {
		
		Member member = new Member();
		member.setMemberNo(memberNo);
		member.setMemberPw(newPw);
		
		return sqlSession.update("emailCheckMapper.changePw",member);
	}

	public int changePw(String newPw, String findEmail) {
		Member member = new Member();
		member.setMemberEmail(findEmail);
		member.setMemberPw(newPw);
		return sqlSession.update("emailCheckMapper.changePw_find",member);
	}
	
	
	
}
