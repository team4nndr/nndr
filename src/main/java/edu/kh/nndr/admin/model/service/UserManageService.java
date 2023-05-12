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
	 * 계정 복구
	 * @param memberNo
	 * @return result
	 */
	int recoverMember(int memberNo);

	/**
	 * 계정 비활성화
	 * @param memberNo
	 * @return result
	 */
	int disableMember(int memberNo);

}
