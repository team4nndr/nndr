package edu.kh.nndr.topMenu.service;

import java.util.List;

import edu.kh.nndr.alram.model.dto.Alram;

public interface TopMenuService {

	/** 알람 목록 조회
	 * @param alram
	 * @return list
	 */

	List<Alram> alramList(int memberNo);

}
