package edu.kh.nndr.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.mainFeed.model.dto.Board;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;
import edu.kh.nndr.member.model.dto.PersonalFriend;

@Repository
public class MemberInfoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 멤버 정보 조회
	 * @param no
	 * @return
	 */
	public MemberInfo personalMember(int no) {
		
		return sqlSession.selectOne("personalMapper.personalMember", no);
	}


	/** 내 소개 추가
	 * @param inputMember
	 * @return
	 */
	public int infoIntro(MemberInfo inputMember) {
		return sqlSession.update("personalMapper.infoIntro", inputMember);
	}


	/** 취미 추가
	 * @param hobbyInput
	 * @return
	 */
	public int infoInput(Map<String, Object> hobbyInput) {
		return sqlSession.update("personalMapper.infoInput", hobbyInput);
	}


	/** 취미
	 * @return
	 */
	public List<MemberHobby> selectHobbyList() {
		return sqlSession.selectList("personalMapper.selectHobbyList");
	}


	/** 개인 취미
	 * @param memberNo
	 * @return
	 */
	public List<MemberHobby> selectPerHobbyList(int memberNo) {
		return sqlSession.selectList("personalMapper.selectPerHobbyList", memberNo);
	}

	
	

	
	/** 취미 추가
	 * @param hobbyInput
	 * @return
	 */
	public int inputhobby(List<MemberHobby> hobbyInput) {
		return sqlSession.update("personalMapper.inputHobby", hobbyInput);
	}
	
	/**취미 삭제
	 * @param memberNo
	 * @return
	 */
	public int deletehobby(int memberNo) {
		return 0;
	}


	/** 취미 추가
	 * @param insertHobby
	 * @return
	 */
	public int insertHobby(List<MemberHobby> insertHobby) {
		return sqlSession.insert("personalMapper.insertHobby", insertHobby);
	}


	/** 취미 삭제
	 * @param deleteHobby
	 * @return
	 */
	public int deleteHobby(List<MemberHobby> deleteHobby) {
		return sqlSession.delete("personalMapper.deleteHobby", deleteHobby);
	}


	/** 이미지 관련
	 * @param no
	 * @return
	 */
	public List<MemberInfo> imgSet(int no) {
		return sqlSession.selectList("personalMapper.imgSet", no);
	}




	/** 친구 추가
	 * @param addMap
	 * @return
	 */
	public int personalAdd(Map<String, String> addMap) {
		return sqlSession.insert("personalMapper.personalAdd", addMap);
	}


	/** 신청 취소
	 * @param delMap
	 * @return
	 */
	public int personalCan(Map<String, String> delMap) {
		return sqlSession.delete("personalMapper.personalCan", delMap);
	}


	/** 친구 확인
	 * @param friendche
	 * @return
	 */
	public PersonalFriend friendChecking(Map<String, Object> friendche) {
		return sqlSession.selectOne("personalMapper.perFriend", friendche);
	}


	/** 배경화면 선택
	 * @param cvCho
	 * @return
	 */
	public int backImg(Map<String, Object> cvCho) {
		return sqlSession.update("personalMapper.backImg", cvCho);
	}


	/** 배경화면 삭제
	 * @param memberNo
	 * @return
	 */
	public int delBackImg(int memberNo) {
		return sqlSession.update("personalMapper.delBackImg", memberNo);
	}


	/** 프로필 선택
	 * @param pcvCho
	 * @return
	 */
	public int proImg(Map<String, Object> pcvCho) {
		return sqlSession.update("personalMapper.proImg", pcvCho);
	}


	/** 게시글 조회
	 * @param no
	 * @return
	 */
	public List<Board> personalfeedList(int no) {
		return sqlSession.selectList("personalMapper.personalfeedList",no);
	}


	/** 멤버 설정 조회
	 * @param no
	 * @return
	 */
	public Member personalInfo(int no) {
		return sqlSession.selectOne("memberMapper.selectMember", no);
	}


	/** 친구 삭제
	 * @param delMap
	 * @return
	 */
	public int personalDel(Map<String, String> delMap) {
		return sqlSession.delete("personalMapper.personalDel", delMap);
	}


	/** 친구 수락
	 * @param acceptMap
	 * @return
	 */
	public int personalAccept(Map<String, String> acceptMap) {
		return sqlSession.update("personalMapper.personalAccept", acceptMap);
	}








}