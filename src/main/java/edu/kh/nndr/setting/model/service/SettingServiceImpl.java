package edu.kh.nndr.setting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.nndr.admin.model.dto.Feedback;
import edu.kh.nndr.setting.model.dao.SettingDAO;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private SettingDAO dao;

	@Override
	public int feedback(Feedback feedback) {
		return dao.feedback(feedback);
	}
}
