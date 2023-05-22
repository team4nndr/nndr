package edu.kh.nndr.main.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 이메일 인증번호 (회원가입)
	 * @param map
	 * @return map
	 */
	public int updateAuthKey(Map<String, String> map) {
		return sqlSession.update("emailMapper.updateAuthKey",map);
	}

	/** 이메일 인증번호 받기 서비스 (회원가입)
	 * @param map
	 * @return map
	 */
	public int insertAuthKey(Map<String, String> map) {
		return sqlSession.update("emailMapper.insertAuthKey",map);
	}

	/** 이메일 인증하기 서비스 (회원가입)
	 * @param paramMap
	 * @return paramMap
	 */
	public int checkAuthKey(Map<String, Object> paramMap) {
		return sqlSession.selectOne("emailMapper.checkAuthKey",paramMap);
	}
	
	
	/** 비밀번호 찾기 이메일 인증하기
	 * @param paramMap
	 * @return paramMap
	 */
	public int findCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("emailMapper.findCheck",paramMap);
	}

}
