package edu.kh.nndr.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.main.dao.MainDAO;

@Service // IOC 
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO dao;
	
	
	// 이메일 인증 확인(비밀번호 바꾸기)
	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

	// 새 계정 만들기(이메일 중복 확인)
	@Override
	public int email(String inputEmail) {
		return dao.email(inputEmail);
	}
	
	
	
	
	
}
