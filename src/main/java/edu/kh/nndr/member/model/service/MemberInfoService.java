package edu.kh.nndr.member.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.dto.PersonalFriend;

public interface MemberInfoService {

	/** 멤버 조회
	 * @param no
	 * @return
	 */
	MemberInfo personalMember(int no);

	/** 내소개 수정
	 * @param member
	 * @return
	 */
	int infoIntro(MemberInfo member);

	/** 취미 수정
	 * @param hobbyInput
	 * @return
	 */
	int infoInput(Map<String, Object> hobbyInput);

	/** 취미 목록
	 * @param memberNo
	 * @return
	 */
	Map<String, Object> selectHobbyList(int memberNo);

	/** 개인 취미 목록
	 * @param memberNo
	 * @return
	 */
	List<MemberHobby> myHobby(int memberNo);

	/** 취미 수정
	 * @param insertHobby
	 * @param deleteHobby
	 * @return
	 */
	int updateHobby(List<MemberHobby> insertHobby, List<MemberHobby> deleteHobby);

	/** 이미지 관련
	 * @param no
	 * @return
	 */
	List<MemberInfo> imgSet(int no);

	/** 친구 추가
	 * @param addMap
	 * @return
	 */
	int personalAdd(Map<String, String> addMap);


	/** 신청 취소
	 * @param delMap
	 * @return
	 */
	int personalCan(Map<String, String> delMap);

	/** 친구 확인
	 * @param friendche
	 * @return
	 */
	PersonalFriend friendChecking(Map<String, Object> friendche);

	/** 배경화면 선택
	 * @param cvCho
	 * @return
	 */
	int backImg(Map<String, Object> cvCho);

	/** 배경화면 삭제
	 * @param memberNo
	 * @return
	 */
	int delBackImg(int memberNo);

	/** 프로필 선택
	 * @param pcvCho
	 * @return
	 */
	int proImg(Map<String, Object> pcvCho);

	/** 개인피드 목록
	 * @param no
	 * @return
	 */
	List<Board> personalfeedList(int no);

	/** 개인피드 멤버 설정 조회
	 * @param no
	 * @return
	 */
	Member personalInfo(int no);

	/** 친구 삭제
	 * @param delMap
	 * @return
	 */
	int personalDel(Map<String, String> delMap);

	/** 친구 수락
	 * @param acceptMap
	 * @return
	 */
	int personalAccept(Map<String, String> acceptMap);






}
