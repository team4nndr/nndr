package edu.kh.nndr.topMenu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.alram.model.dto.Alram;
import edu.kh.nndr.topMenu.model.dao.TopMenuDAO;

@Service
public class TopMenuServiceImpl implements TopMenuService{
	
	@Autowired
	private TopMenuDAO dao;


	// 알람 목록 조회
	@Override
	public List<Alram> alramList(int memberNo) {
		
		return dao.alramList(memberNo);
	}
	

}
