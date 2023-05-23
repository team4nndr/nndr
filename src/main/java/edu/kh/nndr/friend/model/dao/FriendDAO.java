package edu.kh.nndr.friend.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.nndr.friend.model.dto.Friend;
import edu.kh.nndr.member.model.dto.Member;

@Repository
public class FriendDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 친구 요청 목록조회
	 * 
	 * @param memberNo
	 * @return
	 */
	public List<Friend> friendRqList(int memberNo) {
		return sqlSession.selectList("friendMapper.friendRqList", memberNo);
	}

	/**
	 * 친구요청 확인 눌렀을 때
	 * 
	 * @param friendNo
	 * @return
	 */
	public int friendUpdate(int friendNo) {
		return sqlSession.update("friendMapper.friendUpdate", friendNo);
	}

	/**
	 * 친구요청 취소 눌렀을 때
	 * 
	 * @param friendNo
	 * @return
	 */
	public int friendDelete(int friendNo) {
		return sqlSession.delete("friendMapper.friendDelete", friendNo);
	}

	/**
	 * 친구 목록 조회
	 * 
	 * @param memberNo
	 * @return
	 */
	public List<Friend> friendListAll(int memberNo) {
		return sqlSession.selectList("friendMapper.friendListAll", memberNo);
	}

	public List<Friend> friendListsearch(Map<String, Object> map) {
		return sqlSession.selectList("friendMapper.friendListsearch", map);
	}

	/**
	 * 로그인 시 친구 목록 조회
	 * @param memberNo
	 * @return firendList
	 */
	public List<Member> friendListMember(int memberNo) {
		return sqlSession.selectList("memberMapper.friendListMember", memberNo);
	}

}
