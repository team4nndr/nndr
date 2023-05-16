package edu.kh.nndr.setting.model.service;

import edu.kh.nndr.admin.model.dto.Feedback;

public interface SettingService {

	/**
	 * 의견 제출
	 * @param feedback 
	 * @return result
	 */
	int feedback(Feedback feedback);

}
