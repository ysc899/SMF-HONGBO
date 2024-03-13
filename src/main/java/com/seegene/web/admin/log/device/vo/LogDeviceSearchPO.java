package com.seegene.web.admin.log.device.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class LogDeviceSearchPO extends SearchPaggingCommonPO{
	private String startDate;
	
	private String endDate;
}
