package edu.kh.nndr.member.model.service;

import java.io.IOException;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.nndr.member.model.dto.Member;
import edu.kh.nndr.member.model.dto.MemberInfo;

public interface MemberInfoService {

	MemberInfo personalMember(int no);

	int infoIntro(MemberInfo member);

	int infoInput(Map<String, Object> hobbyInput);
	

}
