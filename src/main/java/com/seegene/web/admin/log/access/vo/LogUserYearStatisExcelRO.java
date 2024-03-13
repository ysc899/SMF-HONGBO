package com.seegene.web.admin.log.access.vo;

import lombok.Data;

@Data
public class LogUserYearStatisExcelRO {

	private String logYmd;
	
	private String userId;
	
	private String userType;
	
	private int cnt;
}
