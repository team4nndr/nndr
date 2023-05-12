package edu.kh.nndr.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.admin.model.dto.Pagination;
import edu.kh.nndr.member.model.dto.Member;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 유저 수 반환
	public int getMemberCount() {
		return sqlSession.selectOne("memberMapper.getMemberCount");
	}

	// 유저 목록 반환
	public List<Member> selectMemberList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("memberMapper.selectMemberList", null, rowBounds);
	}

	public Member selectMember(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectMember", memberNo);
	}

	public int deleteMember(int memberNo) {
		return sqlSession.selectOne("memberMapper.deleteMember", memberNo);
	}

	public int recoverMember(int memberNo) {
		return sqlSession.selectOne("memberMapper.recoverMember", memberNo);
	}

	/**
	 * 계정 비활성화
	 * @param memberNo
	 * @return result
	 */
	public int disableMember(int memberNo) {
		return sqlSession.update("memberMapper.disableMember", memberNo);
	}
}
