package edu.kh.nndr.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberHobby;
import edu.kh.nndr.member.model.dto.MemberInfo;

@Repository
public class MemberInfoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberInfo personalMember(int no) {
		
		return sqlSession.selectOne("personalMapper.personalMember", no);
	}


	public int infoIntro(MemberInfo inputMember) {
		return sqlSession.update("personalMapper.infoIntro", inputMember);
	}


	public int infoInput(Map<String, Object> hobbyInput) {
		System.out.println(hobbyInput.get("whatHobby"));
		System.out.println(hobbyInput.get("hobby"));
		System.out.println(hobbyInput.get("memberNo"));
		return sqlSession.update("personalMapper.infoInput", hobbyInput);
	}


	public List<MemberHobby> selectHobbyList() {
		return sqlSession.selectList("personalMapper.selectHobbyList");
	}


	public List<MemberHobby> selectPerHobbyList(int memberNo) {
		return sqlSession.selectList("personalMapper.selectPerHobbyList", memberNo);
	}





}