package com.seegene.web.user.inspection.cert.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class CertSearchPO extends SearchPaggingCommonPO{
	/** 언어 코드 */
	private String codeLangType;
	
	/** 분류 타입 코드 */
	private String codeCertType;
	
	private String codeCenterType;
	
}
