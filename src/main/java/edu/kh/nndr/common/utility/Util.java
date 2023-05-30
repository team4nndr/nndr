package edu.kh.nndr.common.utility;

import java.text.SimpleDateFormat;

public class Util {
	
	/**
	 * Cross Site Scripting (XSS) 방지처리
	 * @param content
	 * @return content
	 */
	public static String XSSHandling(String content) {
		content = content.replaceAll("&","&amp;");
		content = content.replaceAll("<","&lt;");
		content = content.replaceAll(">","&gt;");
		content = content.replaceAll("\"","&quot;");
		
		return content;
	}
	
	/**
	 * 댓글용 XSS 방지 처리
	 * @param content
	 * @return content
	 */
	public static String XSSHandlingReply(String content) {
		
		// 멘션 데이터일 경우 변환 안함
		if(!content.contains("mention-mark")) {
			content = content.replaceAll("<","&lt;");
			content = content.replaceAll(">","&gt;");
			content = content.replaceAll("\"","&quot;");
		}
		
		content = content.replaceAll("&","&amp;");
		 
		return content;
	}
	
	/**
	 * 파일명 변경 메서드
	 * @param originFileName
	 * @return renamedFileName
	 */
	public static String fileRename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);
		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}
}
