package edu.kh.nndr.main.service;


public interface  MainService {

	/** 이메일 인증 확인(비밀번호 바꾸기) 서비스
	 * @param email
	 * @return result
	 */
	int emailCheck(String email);

	/** 이메일 유효성 확인(새 계정 만들기) 서비스 
	 * @param inputEmail
	 * @return result
	 */
	int email(String inputEmail);

	/** 비밀번호 잊으셨습니까 => 이메일 유효성 확인 서비스 
	 * @param emailDup
	 * @return result
	 */
	int emailDup(String emailDup);

	/** 비밀번호 변경 서비스
	 * @param newPw
	 * @param memberNo
	 * @return result
	 */
	int changePw(String newPw, int memberNo);

 	/** 비밀번호 변경 (찾기) 서비스
	 * @param newPw
	 * @param findEmail
	 * @return result
	 */
	int changePw(String newPw, String findEmail);
	
	
	
	
}
