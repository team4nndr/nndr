package edu.kh.nndr.member.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.dto.PersonalFriend;

public interface MemberInfoService {

	MemberInfo personalMember(int no);

	int infoIntro(MemberInfo member);

	int infoInput(Map<String, Object> hobbyInput);

	Map<String, Object> selectHobbyList(int memberNo);

	List<MemberHobby> myHobby(int memberNo);

	int updateHobby(List<MemberHobby> insertHobby, List<MemberHobby> deleteHobby);

	List<Map<String, String>> imgSet(int no);

	int personalAdd(Map<String, String> addMap);


	int personalCan(Map<String, String> delMap);

	PersonalFriend friendChecking(Map<String, Object> friendche);






}
