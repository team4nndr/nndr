package edu.kh.nndr.setting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.member.model.dto.Member;

@Repository
public class SettingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 회원의견 제출
	 * @param feedback
	 * @return result
	 */
	public int feedback(Feedback feedback) {
		return sqlSession.insert("feedbackMapper.feedback", feedback);
	}

	/**
	 * 회원정보 수정(설정 페이지) : MEMBER 테이블
	 * @param loginMember
	 * @return result
	 */
	public int changeMemberInfoAtMember(Member loginMember) {
		return sqlSession.update("memberMapper.changeMemberInfoAtMember", loginMember);
	}
	
	/**
	 * 회원정보 수정(설정 페이지) : MEMBER_INFO 테이블
	 * @param loginMember
	 * @return result
	 */
	public int changeMemberInfoAtMemberInfo(Member loginMember) {
		return sqlSession.update("memberMapper.changeMemberInfoAtMemberInfo", loginMember);
	}

	/**
	 * 회원 비밀번호 수정
	 * @param member
	 * @return result
	 */
	public int changeMemberPasswd(Member member) {
		return sqlSession.update("memberMapper.changeMemberPasswd", member);
	}

	/**
	 * 현재 비밀번호 조회
	 * @param member
	 * @return curPasswd
	 */
	public String checkPasswd(Member member) {
		return sqlSession.selectOne("memberMapper.checkPasswd", member);
	}
}
