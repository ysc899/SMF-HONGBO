package com.seegene.web.common;

import lombok.Data;

/**
 * 통합 fAQ 게시판용 공통 검색 조건
 */
@Data
public class SearchIntegrateSearchPaggingPO extends SearchPaggingCommonPO{
	/** 상위 식별자 */
	private int masterSeq;
	
	/** 언어 코드 */
	private String langType;
	
}

