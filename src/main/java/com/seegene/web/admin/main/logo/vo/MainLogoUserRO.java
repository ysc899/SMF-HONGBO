package com.seegene.web.admin.main.logo.vo;

import lombok.Data;

/**
 * 로고 메인용 리스트
 */
@Data
public class MainLogoUserRO{

	
	/** 관리자용 식별자 */
	private String name;
	
	/** URL */
	private String url;
	
	/** 파일 경로 */
	private String filePath;
	
	/** 로고 이미지 */
	private String logoImage;

}
