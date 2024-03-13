package com.seegene.web.admin.main.logo.vo;

import lombok.Data;

/**
 * 로고 등록 정보
 */
@Data
public class MainLogoAddPO {
	/** 언어코드 */
	private String codeLang;
	
	/** 로고 타입 */
	private String codeType;
	
	/** URL */
	private String url;
	
	/** 로고 이름 */
	private String name;
	/** 시작일 */
	private String startDate;
	/** 종료일 */
	private String endDate;
	
}
