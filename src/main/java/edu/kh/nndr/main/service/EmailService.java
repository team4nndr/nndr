package edu.kh.nndr.main.service;

import java.util.Map;

public interface EmailService {
    
	int signUp(String email, String title);
	
    String createAuthKey();

	int checkAuthKey(Map<String, Object> paramMap);
}
