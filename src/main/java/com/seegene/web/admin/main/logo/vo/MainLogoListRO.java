package com.seegene.web.admin.main.logo.vo;

import java.util.Date;

import lombok.Data;

/**
 * 로고 관리 리스트용
 */
@Data
public class MainLogoListRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;
	
	/** 관리자용 식별자 */
	private String name;
	
	/** 종류 */
	private String codeLogoType;
	private String codeLogoName;

	/** 시작일 */
	private Date startDate;

	/** 종료일 */
	private Date endDate;


	/** 최종 수정일 */
	private Date editDate;
	
}
