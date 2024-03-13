package com.seegene.web.user.customer.webzine.vo;

import java.util.Date;

import lombok.Data;

/**
 * 학술제작물에 리스트 객체
 */
@Data
public class WebzineListRO {

	/** 식별자 */
	private int seq;
	
	private String codeCategoryType;
	
	private String title;
	
	private String url;
	
	/** 섬네일 경로 */
	private String thumFilePath;
	private String thumFileContent;
	
	private Date editDate;
	private String newFlag;
	
	private Date regDate;
	private int  newCnt;
	
}
