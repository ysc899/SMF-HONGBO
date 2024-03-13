package com.seegene.web.admin.main.popup.vo;

import lombok.Data;

/**
 * 팝업 등록 정보
 */
@Data
public class MainPopupAddPO {
	/** 언어코드 */
	private String codeLang;
	/** 로그인 여부 */
	private String codeLogin;
	
	/** URL */
	private String url;
	
	/** 로고 이름 */
	private String title;
	/** 시작일 */
	private String startDate;
	/** 종료일 */
	private String endDate;
	/** 출력 여부 */
	private String printFlag;
	
	/** 이미지파일 넓이 */
	private int popupImageWidth;
	
	/** 이미지파일 높이 */
	private int popupImageHeight;
	
}
