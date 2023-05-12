package edu.kh.nndr.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.nndr.member.model.dao.MemberDAO;
import edu.kh.nndr.member.model.dao.MemberInfoDAO;
import edu.kh.nndr.member.model.dto.Member;
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

	
	
}
