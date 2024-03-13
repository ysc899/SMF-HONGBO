package com.seegene.web.admin.promotion.ebook.vo;

import java.util.Date;

import lombok.Data;

/**
 * 전자책 리스트 ro
 */
@Data
public class EBookViewRO {
	
	
	private int seq;
	
	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;

	/** 카테고리 타입 코드 */
	private String codeCategoryType;
	private String codeCategoryName;

	/** 타이틀 */
	private String title;
	
	/** URL */
	private String url;

	/** 섬네일 경로 */
	private String thumFilePath;
	private String thumFileContent;

	private int printOrder;


	/** 최종 수정일 */
	private Date editDate;
	/** 최종 수정한 사용자 */
	private String editUserId;
	private String editUserName;
	
}

