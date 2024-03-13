package com.seegene.web.admin.log.access.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class LogAccessSearchPO extends SearchPaggingCommonPO{
	private String startDate;
	
	private String endDate;
}
