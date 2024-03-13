package com.seegene.web.user.business.clinical.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class NetworkSearchPO extends SearchPaggingCommonPO{

	/** 지역 코드 */
	private String codeNetworkType;
	/** 언어 코드 */
	private String codeLangType;
	
}
