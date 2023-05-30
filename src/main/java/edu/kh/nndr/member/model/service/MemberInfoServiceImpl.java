package edu.kh.nndr.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.member.model.dao.MemberDAO;
import edu.kh.nndr.member.model.dao.MemberInfoDAO;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.dto.PersonalFriend;

/**
 * @author user1
 *
 */
@Service
public class MemberInfoServiceImpl implements MemberInfoService{
	
	@Autowired
	private MemberInfoDAO dao ;

	// 멤버 인포
	@Override
	public MemberInfo personalMember(int no) {
		return dao.personalMember(no);
	}

	// 내 소개
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int infoIntro(MemberInfo member) {
		return dao.infoIntro(member);
	}

	// 취미 수정
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int infoInput(Map<String, Object> hobbyInput) {
		 int result =dao.infoInput(hobbyInput);
		 return result;
	}
	// 취미 목록
	@Override
	public Map<String, Object> selectHobbyList(int memberNo) {
		List<MemberHobby> hobbyList = dao.selectHobbyList();
		List<MemberHobby> perhobbyList = dao.selectPerHobbyList(memberNo);
				
		Map<String, Object> hobbyMap = new HashMap<String, Object>();
		hobbyMap.put("hobbyList", hobbyList);
		hobbyMap.put("perhobbyList", perhobbyList);
		
		return hobbyMap;
		}

	/** 내 취미
	 *
	 */
	@Override
	public List<MemberHobby> myHobby(int memberNo) {
		List<MemberHobby> perhobbyList = dao.selectPerHobbyList(memberNo);
		return perhobbyList;
	}

	/** 취미 수정
	 *
	 */
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateHobby(List<MemberHobby> insertHobby, List<MemberHobby> deleteHobby) {
		if(insertHobby.size() > 0) {
			int insert = dao.insertHobby(insertHobby);
		}
		if(deleteHobby.size() > 0) {
			int delete = dao.deleteHobby(deleteHobby);
		}
		return 0;
	}

	/** 이미지 관련
	 *
	 */
	@Override
	public List<MemberInfo> imgSet(int no) {
		return dao.imgSet(no);
	}

	/** 친구 추가
	 *
	 */
	@Transactional
	@Override
	public int personalAdd(Map<String, String> addMap) {
		return dao.personalAdd(addMap);
	}


	/** 신청 취소
	 *
	 */
	@Transactional
	@Override
	public int personalCan(Map<String, String> delMap) {
		return dao.personalCan(delMap);
	}

	/** 친구 확인
	 *
	 */
	@Override
	public PersonalFriend friendChecking(Map<String, Object> friendche) {
		return dao.friendChecking(friendche);
	}

	/** 배경화면 선택
	 *
	 */
	@Transactional
	@Override
	public int backImg(Map<String, Object> cvCho) {
		return dao.backImg(cvCho);
	}

	/** 배경화면 삭제
	 *
	 */
	@Transactional
	@Override
	public int delBackImg(int memberNo) {
		return dao.delBackImg(memberNo);
	}

	/** 프로필 이미지 선택
	 *
	 */
	@Transactional
	@Override
	public int proImg(Map<String, Object> pcvCho) {
		return dao.proImg(pcvCho);
	}

	/** 개인피드 리스트
	 *
	 */
	@Override
	public List<Board> personalfeedList(int no) {
		return dao.personalfeedList(no);
	}

	/** 개인 정보 설정
	 *
	 */
	@Override
	public Member personalInfo(int no) {
		return dao.personalInfo(no);
	}

	/** 친구 삭제
	 *
	 */
	@Override
	public int personalDel(Map<String, String> delMap) {
		return dao.personalDel(delMap);
	}

	/** 친구 수락
	 *
	 */
	@Override
	public int personalAccept(Map<String, String> acceptMap) {
		return dao.personalAccept(acceptMap);
	}
	
}
