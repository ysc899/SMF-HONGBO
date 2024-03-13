package com.seegene.web.admin.promotion.vo;

import lombok.Data;

/**
 * 홍보자료 등록 파라미터
 */
@Data
public class PromotionAddPO {
	/** 언어 구분 코드 */
	private String codeLang;
	/** 타이틀 */
	private String title;
	/** 보조 타이틀 */
	private String subTitle;
	/** 재생 url */
	private String url;
	/** 재생 순서 */
	private int printOrder;
	/** 출력 여부 */
	private String printFlag;
}
