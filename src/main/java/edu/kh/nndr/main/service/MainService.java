package edu.kh.nndr.main.service;


public interface  MainService {

	/** 이메일 인증 확인(비밀번호 바꾸기)
	 * @param email
	 * @return result
	 */
	int emailCheck(String email);

	/** 이메일 중복 확인(새 계정 만들기) 
	 * @param inputEmail
	 * @return result
	 */
	int email(String inputEmail);
	
	
	
	
}
