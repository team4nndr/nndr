package edu.kh.nndr.main.service;

import java.util.Map;

public interface EmailService {
    
	int signUp(String email, String title);
	
    String createAuthKey();
    
    // 회원가입 이메일 인증서비스
	int checkAuthKey(Map<String, Object> paramMap);
	
	// 비밀번호 찾기 이메일 인증서비스
	int findCheck(Map<String, Object> paramMap);
}
