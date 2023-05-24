package edu.kh.nndr.setting.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.setting.model.dao.SettingDAO;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private SettingDAO dao;

	// 회원의견 제출 서비스
	@Override
	public int feedback(Feedback feedback) {
		return dao.feedback(feedback);
	}

	// 회원정보 수정(설정 페이지)
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int changeMemberInfo(Member loginMember) {
		if(dao.changeMemberInfoAtMember(loginMember) < 1) return 0;
		return dao.changeMemberInfoAtMemberInfo(loginMember);
	}

	// 회원 비밀번호 수정
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int changeMemberPasswd(Member member) {
		return dao.changeMemberPasswd(member);
	}

	// 환경설정 변경
	@Override
	public int changeSetting(Map<String, Object> paramMap, Member loginMember) {
		paramMap.put("memberNo", loginMember.getMemberNo());
		return dao.changeSetting(paramMap);
	}

	// 현재 비밀번호 조회
	@Override
	public String getPasswd(Member member) {
		return dao.getPasswd(member);
	}
}
