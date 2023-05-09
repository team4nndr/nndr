package edu.kh.nndr.admin.model.service;

import java.util.Map;

import edu.kh.nndr.member.model.dto.Member;

public interface AdminService {

	Map<String, Object> selectMemberList(int cp);

	Member selectMember(int memberNo);

}
