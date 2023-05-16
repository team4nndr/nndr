package edu.kh.nndr.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.nndr.member.model.dao.MemberDAO;
import edu.kh.nndr.member.model.dao.MemberInfoDAO;
import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;

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
//		List<MemberHobby> perhobbyList = dao.selectPerHobbyList(memberNo);
		
				
		// 4. pagination, boardList를 Map에 담아서 반환
		Map<String, Object> hobbyMap = new HashMap<String, Object>();
		hobbyMap.put("hobbyList", hobbyList);
//		hobbyMap.put("perhobbyList", perhobbyList);
		
		return hobbyMap;
		}

			
}
