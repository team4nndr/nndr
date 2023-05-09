package edu.kh.nndr.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
