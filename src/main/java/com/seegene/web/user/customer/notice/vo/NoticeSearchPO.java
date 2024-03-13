package com.seegene.web.user.customer.notice.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class NoticeSearchPO extends SearchPaggingCommonPO{

	/** 지역 코드 */
	private String codeCenterType;
	/** 언어 코드 */
	private String codeLangType;
	
	private boolean loginYn;
	
}
