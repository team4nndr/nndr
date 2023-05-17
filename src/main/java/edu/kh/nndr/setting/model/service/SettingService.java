package edu.kh.nndr.setting.model.service;

import java.util.Map;

import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.member.model.dto.Member;

public interface SettingService {

	/**
	 * 회원의견 제출 서비스
	 * @param feedback 
	 * @return result
	 */
	int feedback(Feedback feedback);

	/**
	 * 회원정보 수정(설정 페이지)
	 * @param loginMember
	 * @return result
	 */
	int changeMemberInfo(Member loginMember);

	/**
	 * 회원 비밀번호 수정
	 * @param member
	 * @return result
	 */
	int changeMemberPasswd(Member member);

	/**
	 * 현재 비밀번호 일치여부 확인
	 * @param member
	 * @return true / false
	 */
	boolean checkPasswd(Member member);

	/**
	 * 환경설정 변경
	 * @param paramMap
	 * @param loginMember
	 * @return result
	 */
	int changeSetting(Map<String, Object> paramMap, Member loginMember);

}
