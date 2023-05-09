package edu.kh.nndr.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberInfo;

@Repository
public class MemberInfoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberInfo personalMember(int no) {
		
		return sqlSession.selectOne("personalMapper.personalMember", no);
	}

}
