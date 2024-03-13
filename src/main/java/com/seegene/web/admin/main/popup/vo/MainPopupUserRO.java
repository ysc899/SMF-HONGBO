package com.seegene.web.admin.main.popup.vo;

import lombok.Data;

/**
 * 로고 메인용 리스트
 */
@Data
public class MainPopupUserRO{
	
	/** 관리자용 식별자 */
	private String title;
	
	/** URL */
	private String url;
	
	/** 파일 경로 */
	private String filePath;
	
	/** 로고 이미지 */
	private String fileContent;
	
	private String codeLangType;
	private String codeLoginType;
	
	private int popupImageWidth;
	private int popupImageHeight;


}
