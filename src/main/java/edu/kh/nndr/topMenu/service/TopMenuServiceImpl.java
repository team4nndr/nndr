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

	@Override
	public List<Alram> alramList(Alram alram) {
		return dao.alramList(alram);
	}
	

}
