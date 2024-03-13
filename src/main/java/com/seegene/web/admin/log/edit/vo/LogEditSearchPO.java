package com.seegene.web.admin.log.edit.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class LogEditSearchPO extends SearchPaggingCommonPO{
	private String startDate;
	
	private String endDate;
}
