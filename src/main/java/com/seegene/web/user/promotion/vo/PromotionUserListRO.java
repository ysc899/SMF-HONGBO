package com.seegene.web.user.promotion.vo;

import lombok.Data;

/**
 * 홍보자료 리스트 객체
 */
@Data
public class PromotionUserListRO {

	/** 식별자 */
	private int seq;
	
	private String title;
	private String subTitle;
	
	private String url;
	
	/** 섬네일 경로 */
	private String thumFilePath;
	private String thumFileContent;
}
