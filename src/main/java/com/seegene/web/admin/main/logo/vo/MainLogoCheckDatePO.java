package com.seegene.web.admin.main.logo.vo;

import java.util.Date;

import lombok.Data;

/**
 * 로고 기간 확인용
 */
@Data
public class MainLogoCheckDatePO {

	/** 메뉴 언어 타입 코드 */
	private String codeLang;
	
	/** 종류 */
	private String codeType;

	/** 시작일 */
	private String startDate;

	/** 종료일 */
	private String endDate;

}
