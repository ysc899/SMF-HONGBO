package com.seegene.web.user.customer.payrollNotice.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class PayrollSearchPO extends SearchPaggingCommonPO{

	/** 지역 코드 */
	private String codeCenterType;
	/** 언어 코드 */
	private String codeLangType;
	
}
