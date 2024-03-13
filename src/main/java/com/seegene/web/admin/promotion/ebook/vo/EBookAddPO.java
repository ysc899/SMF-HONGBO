package com.seegene.web.admin.promotion.ebook.vo;

import lombok.Data;

/**
 * 인증현황 등록 파라미터
 */
@Data
public class EBookAddPO {
	/** 언어 구분 코드 */
	private String codeLang;
	
	/** 분류 */
	private String category;
	
	/** 타이틀 */
	private String title;

	/** 내용 */
	private String url;

	private int printOrder;

}
