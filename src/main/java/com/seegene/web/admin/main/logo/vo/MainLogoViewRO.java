package com.seegene.web.admin.main.logo.vo;

import java.util.Date;

import lombok.Data;

/**
 * 로고 관리 리스트용
 */
@Data
public class MainLogoViewRO{

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
	
	/** URL */
	private String url;
	
	/** 파일 경로 */
	private String filePath;
	
	/** 로고 이미지 */
	private String logoImage;

	/** 최종 수정일 */
	private Date editDate;
	
	/** 최종 수정자 ID */
	private String editUserId;
	/** 최종 수정자 명 */
	private String editUserName;
	
	
	
	
}
