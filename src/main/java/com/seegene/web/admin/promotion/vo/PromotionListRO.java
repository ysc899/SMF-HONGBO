package com.seegene.web.admin.promotion.vo;

import java.util.Date;

import lombok.Data;

/**
 * 홍로 리스트용 RO
 */
@Data
public class PromotionListRO {
	private int row;
	
	private int seq;
	
	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;
	
	/** 타이틀 */
	private String title;

	/** 보조 타이틀 */
	private String subTitle;
	
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;
	
	/** 최종 수정일 */
	private Date editDate;
	
}

