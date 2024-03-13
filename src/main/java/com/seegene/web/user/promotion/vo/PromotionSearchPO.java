package com.seegene.web.user.promotion.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class PromotionSearchPO extends SearchPaggingCommonPO{
	/** 언어 코드 */
	private String codeLangType;
	
	/** 홍보 종류 타입 코드 */
	private String codePromotionType;
	
}
