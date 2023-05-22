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

	@Override
	public MemberInfo personalMember(int no) {
	
		
		return dao.personalMember(no);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int infoIntro(MemberInfo member) {
		return dao.infoIntro(member);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int infoInput(Map<String, Object> hobbyInput) {
		 int result =dao.infoInput(hobbyInput);
		 return result;
	}

	@Override
	public Map<String, Object> selectHobbyList(int memberNo) {
		// 1. 특정 게시판의 삭제되지 않은 게시글 수 조회
		List<MemberHobby> hobbyList = dao.selectHobbyList();
		List<MemberHobby> perhobbyList = dao.selectPerHobbyList(memberNo);
		
				
		// 4. pagination, boardList를 Map에 담아서 반환
		Map<String, Object> hobbyMap = new HashMap<String, Object>();
		hobbyMap.put("hobbyList", hobbyList);
		hobbyMap.put("perhobbyList", perhobbyList);
		
		return hobbyMap;
		}

	@Override
	public List<MemberHobby> myHobby(int memberNo) {
		List<MemberHobby> perhobbyList = dao.selectPerHobbyList(memberNo);
		return perhobbyList;
	}

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

	@Override
	public List<MemberInfo> imgSet(int no) {
		return dao.imgSet(no);
	}

	@Transactional
	@Override
	public int personalAdd(Map<String, String> addMap) {
		return dao.personalAdd(addMap);
	}


	@Transactional
	@Override
	public int personalCan(Map<String, String> delMap) {
		return dao.personalCan(delMap);
	}

	@Override
	public PersonalFriend friendChecking(Map<String, Object> friendche) {
		return dao.friendChecking(friendche);
	}

	@Transactional
	@Override
	public int backImg(Map<String, Object> cvCho) {
		return dao.backImg(cvCho);
	}

	@Transactional
	@Override
	public int delBackImg(int memberNo) {
		return dao.delBackImg(memberNo);
	}

	@Transactional
	@Override
	public int proImg(Map<String, Object> pcvCho) {
		return dao.proImg(pcvCho);
	}

	@Override
	public List<Board> personalfeedList(int no) {
		return dao.personalfeedList(no);
	}

	@Override
	public Member personalInfo(int no) {
		return dao.personalInfo(no);
	}

	@Override
	public int personalDel(Map<String, String> delMap) {
		return dao.personalDel(delMap);
	}

	@Override
	public int personalAccept(Map<String, String> acceptMap) {
		return dao.personalAccept(acceptMap);
	}

	
	
			
	
}
