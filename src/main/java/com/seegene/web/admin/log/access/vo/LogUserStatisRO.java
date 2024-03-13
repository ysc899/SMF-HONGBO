package com.seegene.web.admin.log.access.vo;

import lombok.Data;

@Data
public class LogUserStatisRO {

	private String userId;
	
	private String logYmd;
	
	private int cnt;
}
