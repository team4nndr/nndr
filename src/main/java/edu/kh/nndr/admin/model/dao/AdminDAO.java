package edu.kh.nndr.admin.model.dao;

import java.util.List;
import java.util.Map;

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

	/**
	 * 총 회원 수 조회
	 * @return count
	 */
	public int getMemberCount() {
		return sqlSession.selectOne("memberMapper.getMemberCount");
	}

	/**
	 * 전체 회원 목록 조회
	 * @param pagination
	 * @return memberList
	 */
	public List<Member> selectMemberList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("memberMapper.selectMemberList", null, rowBounds);
	}

	/**
	 * 특정 회원 조회 by memberNo
	 * @param memberNo
	 * @return member
	 */
	public Member selectMember(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectMember", memberNo);
	}

	/**
	 * 계정 삭제
	 * @param memberNo
	 * @return result
	 */
	public int deleteMember(int memberNo) {
		return sqlSession.update("memberMapper.deleteMember", memberNo);
	}

	/**
	 * 계정 복구
	 * @param memberNo
	 * @return result
	 */
	public int enableMember(int memberNo) {
		return sqlSession.update("memberMapper.enableMember", memberNo);
	}

	/**
	 * 계정 비활성화
	 * @param memberNo
	 * @return result
	 */
	public int disableMember(int memberNo) {
		return sqlSession.update("memberMapper.disableMember", memberNo);
	}

	/**
	 * 회원 검색 결과 목록 수 반환
	 * @param paramMap
	 * @return count
	 */
	public int getMemberCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("memberMapper.getMemberSearchCount", paramMap);
	}

	/**
	 * 회원 검색 결과 조회
	 * @param paramMap
	 * @param pagination
	 * @return memberList
	 */
	public List<Member> selectMemberList(Map<String, Object> paramMap, Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("memberMapper.selectMemberSearchList", paramMap, rowBounds);
	}
}
