package com.seegene.web.admin.log.error.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class LogErrorSearchPO extends SearchPaggingCommonPO{
	private String startDate;
	
	private String endDate;
}
