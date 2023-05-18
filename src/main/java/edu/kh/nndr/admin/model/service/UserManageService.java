package edu.kh.nndr.admin.model.service;

import java.util.Map;

import edu.kh.nndr.member.model.dto.Member;

public interface UserManageService {

	Map<String, Object> selectMemberList(int cp);

	Member selectMember(int memberNo);

	/**
	 * 계정 삭제
	 * @param memberNo
	 * @return result
	 */
	int deleteMember(int memberNo);

	/**
	 * 계정 비활성화
	 * @param memberNo
	 * @return result
	 */
	int disableMember(int memberNo);

	/**
	 * 계정 정상화(삭제유저 복구, 비활성 해제)
	 * @param memberNo
	 * @return result
	 */
	int enableMember(int memberNo);

	/**
	 * 회원 검색 결과 조회
	 * @param paramMap
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMemberList(Map<String, Object> paramMap, int cp);

}
