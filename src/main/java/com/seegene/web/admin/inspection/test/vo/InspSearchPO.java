package com.seegene.web.admin.inspection.test.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

/**
 * 검사항목 조회 검색용
 */
@Data
public class InspSearchPO extends SearchPaggingCommonPO{
	
	private String codeLangType;
	
	private String codeInspEditSt;
}
