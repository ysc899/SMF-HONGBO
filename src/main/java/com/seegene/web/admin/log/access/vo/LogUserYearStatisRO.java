package com.seegene.web.admin.log.access.vo;

import lombok.Data;

@Data
public class LogUserYearStatisRO {

	private String year;
	
	private String month;
	
	private String userType;
	
	private int cnt;
}
