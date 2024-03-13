package com.seegene.web.user.customer.webzine.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class WebzineSearchPO extends SearchPaggingCommonPO{
	/** 언어 코드 */
	private String codeLangType;
	
	/** 카테고리 타입 코드 */
	private String codeEbookCatType;
	
}
